#import "DBStatusBar.h"
#import "DBStatusBarItemView.h"
#import "DBStatusWindowController.h"

@interface DBStatusBar () <PanelControllerDelegate>
@property (nonatomic, strong) DBStatusWindowController *windowController;
@end

@implementation DBStatusBar


#pragma mark -

- (instancetype)init
{
    
    return [self initWithWindowController:nil statusBarItemView:nil];
}

- (instancetype)initWithWindowController:(DBStatusWindowController *)windowController
{
    return [self initWithWindowController:windowController statusBarItemView:nil];
}

- (instancetype)initWithWindowController:(DBStatusWindowController *)windowController statusBarItemView:(DBStatusBarItemView *)itemView
{
    if (!windowController) {
        // FIXME: don't use DemoPanel for default
        windowController = [[DBStatusWindowController alloc] initWithWindowNibName:@"DemoPanel"];
        windowController.delegate = self;
    }
    
    self = [super init];
    if (self) {
        _windowController = windowController;
        if (!windowController.delegate) {
            windowController.delegate = self;
        }
        [windowController addObserver:self forKeyPath:@"hasActivePanel" options:0 context:nil];
        
        
        if (!itemView) {
            // Install status item into the menu bar
            NSStatusItem *statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:STATUS_ITEM_VIEW_WIDTH];
            _statusItemView = [[DBStatusBarItemView alloc] initWithStatusItem:statusItem];
            _statusItemView.image = [NSImage imageNamed:@"Status"];
            _statusItemView.alternateImage = [NSImage imageNamed:@"StatusHighlighted"];
            _statusItemView.action = @selector(itemClicked);
            _statusItemView.target = self;
        }
        else {
            _statusItemView = itemView;
        }
        
    }
    return self;
}

- (void)dealloc
{
    [[NSStatusBar systemStatusBar] removeStatusItem:self.statusItem];
    [self.windowController removeObserver:self forKeyPath:@"hasActivePanel"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"hasActivePanel"]) {
        self.statusItemView.highlighted = self.windowController.hasActivePanel;
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark -
#pragma mark Public accessors

- (NSStatusItem *)statusItem
{
    return self.statusItemView.statusItem;
}

#pragma mark -

- (BOOL)hasActiveIcon
{
    return self.statusItemView.isHighlighted;
}

- (void)setHasActiveIcon:(BOOL)flag
{
    self.statusItemView.highlighted = flag;
    self.windowController.hasActivePanel = flag;
}

- (DBStatusBarItemView *)statusItemViewForPanelController:(DBStatusWindowController *)controller
{
    return self.statusItemView;
}

- (void)itemClicked
{
    self.hasActiveIcon = !self.hasActiveIcon;
}

@end
