#import <Cocoa/Cocoa.h>

@class PreferencesViewController;

@interface PreferencesWindowController : NSWindowController {
	IBOutlet NSView* preferencesView;
	PreferencesViewController* preferencesViewController;
}

@end
