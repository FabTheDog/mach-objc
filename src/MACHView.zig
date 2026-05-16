const std = @import("std");
const objc = @import("objc.zig");
const app_kit = @import("app_kit.zig");
const foundation = @import("foundation.zig");
const quartz_core = @import("quartz_core.zig");

pub const MACHView = objc.DefineClass(struct {
    pub const class_name = "MACHView";
    pub const superclass = app_kit.View;

    pub const Self = objc.Self(class_name);

    pub const implementation = objc.implementation(class_name, struct {
        _keyDown_block: objc.Block(fn (?*app_kit.Event) void),
        _keyUp_block: objc.Block(fn (?*app_kit.Event) void),
        _flagsChanged_block: objc.Block(fn (?*app_kit.Event) void),
        _mouseMoved_block: objc.Block(fn (?*app_kit.Event) void),
        _mouseDown_block: objc.Block(fn (?*app_kit.Event) void),
        _mouseUp_block: objc.Block(fn (?*app_kit.Event) void),
        _scrollWheel_block: objc.Block(fn (?*app_kit.Event) void),
        _magnify_block: objc.Block(fn (?*app_kit.Event) void),
        _insertText_block: objc.Block(fn (?*app_kit.Event, u32) void),
        _render_block: objc.Block(fn (?*quartz_core.MetalDrawable) void),
        trackingArea: objc.StrongObject("NSTrackingArea"),
        _displayLink: objc.StrongObject("CAMetalDisplayLink"),
    });

    pub const methods = struct {
        // Overrides NSView's designated initializer to install a tracking
        // area covering the view's visible rect, so we receive
        // mouseEntered/Exited and mouseMoved callbacks.
        pub fn @"initWithFrame:"(old_self: *Self, frame: app_kit.Rect) ?*Self {
            const super = objc.superFn(app_kit.View, "initWithFrame:", fn (*Self, app_kit.Rect) ?*Self);
            const self = super(old_self, frame) orelse return null;

            const opts: app_kit.TrackingAreaOptions =
                app_kit.TrackingMouseEnteredAndExited |
                app_kit.TrackingMouseMoved |
                app_kit.TrackingActiveInActiveApp;
            const rect = app_kit.View.visibleRect(@ptrCast(self));
            const tracking = app_kit.TrackingArea.alloc().initWithRect_options_owner_userInfo(
                rect,
                opts,
                @ptrCast(self),
                null,
            );
            // Take ownership of the +1 retained tracking area into the
            // strong ivar slot (no extra retain).
            const slot = implementation.trackingArea.slot(self) orelse return self;
            slot.* = @ptrCast(tracking);

            app_kit.View.addTrackingArea(@ptrCast(self), tracking);
            return self;
        }

        pub fn canBecomeKeyView(_: *Self) bool {
            return true;
        }

        pub fn acceptsFirstResponder(_: *Self) bool {
            return true;
        }

        /// Prevent AppKit's default key handling (e.g. Esc exiting fullscreen)
        /// from firing.
        pub fn @"doCommandBySelector:"(_: *Self, _: objc.SEL) void {}

        pub fn @"keyDown:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._keyDown_block.invoke(self, .{event});
            // [self interpretKeyEvents:[NSArray arrayWithObject:event]]
            const arr = foundation.Array(app_kit.Event).arrayWithObject(event.?);
            app_kit.Responder.interpretKeyEvents(@ptrCast(self), @ptrCast(arr));
        }

        pub fn @"keyUp:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._keyUp_block.invoke(self, .{event});
        }

        pub fn @"flagsChanged:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._flagsChanged_block.invoke(self, .{event});
        }

        pub fn @"mouseMoved:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._mouseMoved_block.invoke(self, .{event});
        }

        pub fn @"mouseDragged:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._mouseMoved_block.invoke(self, .{event});
        }

        pub fn @"rightMouseDragged:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._mouseMoved_block.invoke(self, .{event});
        }

        pub fn @"otherMouseDragged:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._mouseMoved_block.invoke(self, .{event});
        }

        pub fn @"mouseDown:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._mouseDown_block.invoke(self, .{event});
        }

        pub fn @"rightMouseDown:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._mouseDown_block.invoke(self, .{event});
        }

        pub fn @"otherMouseDown:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._mouseDown_block.invoke(self, .{event});
        }

        pub fn @"mouseUp:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._mouseUp_block.invoke(self, .{event});
        }

        pub fn @"rightMouseUp:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._mouseUp_block.invoke(self, .{event});
        }

        pub fn @"otherMouseUp:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._mouseUp_block.invoke(self, .{event});
        }

        pub fn @"scrollWheel:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._scrollWheel_block.invoke(self, .{event});
        }

        pub fn @"magnifyWithEvent:"(self: *Self, event: ?*app_kit.Event) void {
            _ = implementation._magnify_block.invoke(self, .{event});
        }

        pub fn @"insertText:"(self: *Self, string: ?*foundation.String) void {
            const event = app_kit.Application.sharedApplication().currentEvent();

            // Unwrap NSAttributedString → NSString if needed.
            const characters: ?*foundation.String = blk: {
                if (objc.isKindOf(string, foundation.AttributedString)) {
                    const attr: *foundation.AttributedString = @ptrCast(string.?);
                    break :blk attr.string();
                }
                break :blk string;
            };
            const chars = characters orelse return;

            var range: foundation.Range = .init(0, chars.length());
            while (range.length > 0) {
                var codepoint: u32 = 0;
                const got = chars.getBytes_maxLength_usedLength_encoding_options_range_remainingRange(
                    @ptrCast(&codepoint),
                    @sizeOf(u32),
                    null,
                    foundation.UTF32StringEncoding,
                    0,
                    range,
                    &range,
                );
                if (!got) break;
                // Skip Unicode "private use" function-key range that AppKit
                // synthesises for arrow keys etc.
                if (codepoint >= 0xf700 and codepoint <= 0xf7ff) continue;
                _ = implementation._insertText_block.invoke(self, .{ event, codepoint });
            }
        }

        pub fn @"metalDisplayLink:needsUpdate:"(
            self: *Self,
            _: ?*quartz_core.MetalDisplayLink, // unused
            update: ?*quartz_core.MetalDisplayLinkUpdate,
        ) void {
            const drawable = if (update) |u| u.drawable() else null;
            _ = implementation._render_block.invoke(self, .{drawable});
        }
    };

    pub const direct_methods = struct {
        pub fn startDisplayLink(self: *Self) callconv(.c) bool {
            if (implementation._displayLink.get(self) != null) return true;

            const base_layer = app_kit.View.layer(@ptrCast(self));
            if (!objc.isKindOf(base_layer, quartz_core.MetalLayer)) return false;
            const metal_layer: *quartz_core.MetalLayer = @ptrCast(base_layer);

            const link = quartz_core.MetalDisplayLink.alloc().initWithMetalLayer(metal_layer);
            // Take ownership of the +1 retained `link` directly into the
            // ivar slot (no extra retain). Subsequent `set(self, …)` calls
            // would balance through `objc_storeStrong`.
            const slot = implementation._displayLink.slot(self) orelse return false;
            slot.* = link;

            link.setDelegate(@ptrCast(self));
            link.addToRunLoop_forMode(foundation.RunLoop.mainRunLoop(), app_kit.NSRunLoopCommonModes);
            return true;
        }

        pub fn stopDisplayLink(self: *Self) callconv(.c) void {
            if (implementation._displayLink.get(self)) |link_ptr| {
                const link: *quartz_core.MetalDisplayLink = @ptrCast(link_ptr);
                link.invalidate();
            }
            implementation._displayLink.set(self, null);
        }
    };
});
