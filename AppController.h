#import <Cocoa/Cocoa.h>

@class MainWindowController, PreferencesWindowController;

@interface AppController : NSObject {
	MainWindowController* mainWindowController;
	PreferencesWindowController* preferencesWindowController;
}

- (IBAction) orderFrontPreferencesWindow:(id)_sender;

@end
