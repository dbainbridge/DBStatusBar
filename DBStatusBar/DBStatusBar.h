#define STATUS_ITEM_VIEW_WIDTH 24.0

#pragma mark -

@class DBStatusBarItemView;
@class DBStatusWindowController;

@interface DBStatusBar : NSObject

@property (nonatomic) BOOL hasActiveIcon;
@property (nonatomic, strong, readonly) NSStatusItem *statusItem;
@property (nonatomic, strong, readonly) DBStatusBarItemView *statusItemView;

- (instancetype)initWithWindowController:(DBStatusWindowController *)windowController;
- (instancetype)initWithWindowController:(DBStatusWindowController *)windowController statusBarItemView:(DBStatusBarItemView *)itemView;

@end
