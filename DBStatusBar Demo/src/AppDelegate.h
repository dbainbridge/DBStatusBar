#import "DBStatusBar.h"
#import "DBStatusWindowController.h"

@class DemoStatusWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate, PanelControllerDelegate>

@property (nonatomic, strong) DBStatusBar *statusBar;

@end
