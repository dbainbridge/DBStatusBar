#import "AppDelegate.h"
#import "DemoStatusWindowController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

#pragma mark -

#pragma mark -


#pragma mark - NSApplicationDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    // Install icon into the menu bar
    DemoStatusWindowController *windowController = [[DemoStatusWindowController alloc] initWithWindowNibName:@"DemoPanel"];
    self.statusBar = [[DBStatusBar alloc] initWithWindowController:windowController];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{
    // Explicitly remove the icon from the menu bar
    self.statusBar = nil;
    return NSTerminateNow;
}

@end
