#import <Cocoa/Cocoa.h>

@class PreferencesViewController;

@interface PreferencesWindowController : NSWindowController {
	IBOutlet NSView* view;
	PreferencesViewController* preferencesViewController;
}

@end
