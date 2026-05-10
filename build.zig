const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});

    const module = b.addModule("mach-objc", .{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });
    module.linkSystemLibrary("objc", .{});

    // TODO: Maybe split this out into a separate module so we only link these in when needed.
    if (target.result.os.tag == .macos) {
        module.linkFramework("AppKit", .{});
        module.linkFramework("CoreVideo", .{});
        module.linkFramework("QuartzCore", .{});
    } else {
        module.linkFramework("UIKit", .{});
        // TODO: Add iOS asm files once they are generated.
    }

    if (b.lazyDependency("xcode_frameworks", .{})) |dep| {
        module.addSystemFrameworkPath(dep.path("Frameworks"));
        module.addSystemIncludePath(dep.path("include"));
        module.addLibraryPath(dep.path("lib"));
    }

    const unit_tests = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    unit_tests.root_module.linkSystemLibrary("objc", .{});
    if (target.result.os.tag == .macos) {
        unit_tests.root_module.linkFramework("AppKit", .{});
        unit_tests.root_module.linkFramework("CoreVideo", .{});
        unit_tests.root_module.linkFramework("Metal", .{});
        unit_tests.root_module.linkFramework("QuartzCore", .{});
        unit_tests.root_module.linkFramework("AVFAudio", .{});
        unit_tests.root_module.linkFramework("CoreMIDI", .{});
    } else {
        unit_tests.root_module.linkFramework("UIKit", .{});
    }
    if (b.lazyDependency("xcode_frameworks", .{})) |dep| {
        unit_tests.root_module.addSystemFrameworkPath(dep.path("Frameworks"));
        unit_tests.root_module.addSystemIncludePath(dep.path("include"));
        unit_tests.root_module.addLibraryPath(dep.path("lib"));
    }

    const run_unit_tests = b.addRunArtifact(unit_tests);
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_unit_tests.step);

    const generator_exe = b.addExecutable(.{
        .name = "generator",
        .root_module = b.createModule(.{
            .root_source_file = b.path("generator.zig"),
            .target = b.graph.host,
            .optimize = .ReleaseSafe,
        }),
    });
    b.installArtifact(generator_exe);

    const gen_run = b.addRunArtifact(generator_exe);
    gen_run.addArg("--generate-all");
    if (b.lazyDependency("xcode_frameworks", .{})) |dep| {
        gen_run.addArg("--frameworks-dir");
        gen_run.addDirectoryArg(dep.path("Frameworks"));
        gen_run.addArg("--include-dir");
        gen_run.addDirectoryArg(dep.path("include"));
    }

    const generate_step = b.step("generate", "Generate files");
    generate_step.dependOn(&gen_run.step);
}
