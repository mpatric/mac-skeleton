#import <Cocoa/Cocoa.h>

@class MainViewController;

@interface MainWindowController : NSWindowController {
	IBOutlet NSView* mainView;
	MainViewController* mainViewController;
}

@end
