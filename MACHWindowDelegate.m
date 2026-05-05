#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface MACHWindowDelegate : NSObject
@end

@implementation MACHWindowDelegate {
    void (^_windowDidResize_block)(void);
    bool (^_windowShouldClose_block)(void);
    void (^_windowDidChangeBackingProperties_block)(void);
    void (^_windowDidBecomeKey_block)(void);
    void (^_windowDidResignKey_block)(void);
}

- (void)setBlock_windowDidResize:(void (^)(void))windowDidResize_block __attribute__((objc_direct)) {
    _windowDidResize_block = windowDidResize_block;
}

- (void)setBlock_windowShouldClose:(bool (^)(void))windowShouldClose_block __attribute__((objc_direct)) {
    _windowShouldClose_block = windowShouldClose_block;
}

- (void)setBlock_windowDidChangeBackingProperties:(void (^)(void))windowDidChangeBackingProperties_block __attribute__((objc_direct)) {
    _windowDidChangeBackingProperties_block = windowDidChangeBackingProperties_block;
}

- (void)setBlock_windowDidBecomeKey:(void (^)(void))windowDidBecomeKey_block __attribute__((objc_direct)) {
    _windowDidBecomeKey_block = windowDidBecomeKey_block;
}

- (void)setBlock_windowDidResignKey:(void (^)(void))windowDidResignKey_block __attribute__((objc_direct)) {
    _windowDidResignKey_block = windowDidResignKey_block;
}

- (void) windowDidResize:(NSNotification *) notification {
    if (self->_windowDidResize_block) self->_windowDidResize_block();
}

- (BOOL)windowShouldClose:(NSWindow *)sender {
    if (self->_windowShouldClose_block) self->_windowShouldClose_block();
    return NO;
}

- (void)windowDidChangeBackingProperties:(NSNotification *)notification {
    if (self->_windowDidChangeBackingProperties_block) self->_windowDidChangeBackingProperties_block();
}

- (void)windowDidBecomeKey:(NSNotification *)notification {
    if (self->_windowDidBecomeKey_block) self->_windowDidBecomeKey_block();
}

- (void)windowDidResignKey:(NSNotification *)notification {
    if (self->_windowDidResignKey_block) self->_windowDidResignKey_block();
}

- (void)windowWillClose:(NSNotification *)notification {
    //NSLog(@"windowWillClose");
}
@end
