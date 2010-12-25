#import "PreferencesWindowController.h"
#import "PreferencesViewController.h"

@implementation PreferencesWindowController

- (void) windowDidLoad {
	preferencesViewController = [[PreferencesViewController alloc] initWithNibName:@"PreferencesView" bundle:nil];
	// patch the preferences view into the responder chain
	NSResponder * aNextResponder = [self nextResponder];
	[self setNextResponder:preferencesViewController];
	[preferencesViewController setNextResponder:aNextResponder];
}

- (void)dealloc {
	[preferencesViewController release];
	[super dealloc];
}

@end
