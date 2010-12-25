#import <Cocoa/Cocoa.h>

@class MainViewController;

@interface MainWindowController : NSWindowController {
	IBOutlet NSView* view;
	MainViewController* mainViewController;
}

@end
