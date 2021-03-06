# DBStatusBar
DBStatusBar provides a custom popover window appearing from an icon in the Mac OS X menu bar.

DBStatusBar is a fork of the "Popup" project that was drastically refactored to make it much easier to integrate into your project.

````
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
````

To use in your own project copy the files in the DBStatusBar folder and modify the DemoPanel.xib for your use.
