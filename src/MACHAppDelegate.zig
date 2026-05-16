const objc = @import("objc.zig");
const app_kit = @import("app_kit.zig");
const foundation = @import("foundation.zig");

pub const MACHAppDelegate = objc.DefineClass(struct {
    pub const class_name = "MACHAppDelegate";
    pub const superclass = foundation.ObjectInterface;

    pub const Self = objc.Self(class_name);

    pub const implementation = objc.implementation(class_name, struct {
        _runBlock: objc.Block(fn () void),
    });

    pub const methods = struct {
        pub fn @"applicationDidFinishLaunching:"(self: *Self, _: ?*app_kit.Notification) void {
            _ = implementation._runBlock.invoke(self, .{});
        }

        pub fn @"applicationShouldTerminate:"(self: *Self, sender: ?*app_kit.Application) usize {
            _ = self;
            _ = sender;
            return 0; // NSTerminateCancel
        }

        pub fn @"applicationShouldTerminateAfterLastWindowClosed:"(self: *Self, app: ?*app_kit.Application) bool {
            _ = self;
            _ = app;
            return true;
        }
    };

    pub const direct_methods = struct {
        pub fn @"setRunBlock:"(self: *Self, block: ?*anyopaque) callconv(.c) void {
            implementation._runBlock.set(self, block);
        }
    };
});
