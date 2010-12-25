#import "MainWindowController.h"
#import "MainViewController.h"

@implementation MainWindowController

- (void) windowDidLoad {
	mainViewController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
	// patch the main view into the responder chain
	NSResponder * aNextResponder = [self nextResponder];
	[self setNextResponder:mainViewController];
	[mainViewController setNextResponder:aNextResponder];
}

- (void)dealloc {
	[mainViewController release];
	[super dealloc];
}

@end
