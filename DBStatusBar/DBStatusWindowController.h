#import "DBStatusBackgroundView.h"
#import "DBStatusBarItemView.h"

@class DBStatusWindowController;

@protocol PanelControllerDelegate <NSObject>

@optional

- (DBStatusBarItemView *)statusItemViewForPanelController:(DBStatusWindowController *)controller;

@end

#pragma mark -

@interface DBStatusWindowController : NSWindowController <NSWindowDelegate>

@property (nonatomic, assign) IBOutlet DBStatusBackgroundView *backgroundView;

@property (nonatomic, assign) BOOL hasActivePanel;
@property (nonatomic, assign) id<PanelControllerDelegate> delegate;

- (id)initWithDelegate:(id<PanelControllerDelegate>)delegate windowNibName:(NSString *)windowNibName;

- (NSTimeInterval)openPanelWithDuration:(NSTimeInterval)duration;
- (NSTimeInterval)openPanel;
- (void)closePanel;

- (void)windowResized:(NSWindow *)aWindow;

@end
