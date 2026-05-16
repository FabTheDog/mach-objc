const objc = @import("objc.zig");
const app_kit = @import("app_kit.zig");
const foundation = @import("foundation.zig");

pub const MACHWindowDelegate = objc.DefineClass(struct {
    pub const class_name = "MACHWindowDelegate";
    pub const superclass = foundation.ObjectInterface;

    pub const Self = objc.Self(class_name);

    pub const implementation = objc.implementation(class_name, struct {
        _windowDidResize_block: objc.Block(fn () void),
        _windowShouldClose_block: objc.Block(fn () bool),
        _windowDidChangeBackingProperties_block: objc.Block(fn () void),
        _windowDidBecomeKey_block: objc.Block(fn () void),
        _windowDidResignKey_block: objc.Block(fn () void),
    });

    pub const methods = struct {
        pub fn @"windowDidResize:"(self: *Self, _: ?*app_kit.Notification) void {
            _ = implementation._windowDidResize_block.invoke(self, .{});
        }

        pub fn @"windowShouldClose:"(self: *Self, _: ?*app_kit.Window) bool {
            _ = implementation._windowShouldClose_block.invoke(self, .{});
            return false;
        }

        pub fn @"windowDidChangeBackingProperties:"(self: *Self, _: ?*app_kit.Notification) void {
            _ = implementation._windowDidChangeBackingProperties_block.invoke(self, .{});
        }

        pub fn @"windowDidBecomeKey:"(self: *Self, _: ?*app_kit.Notification) void {
            _ = implementation._windowDidBecomeKey_block.invoke(self, .{});
        }

        pub fn @"windowDidResignKey:"(self: *Self, _: ?*app_kit.Notification) void {
            _ = implementation._windowDidResignKey_block.invoke(self, .{});
        }

        pub fn @"windowWillClose:"(_: *Self, _: ?*app_kit.Notification) void {
            // TODO
        }
    };
});
