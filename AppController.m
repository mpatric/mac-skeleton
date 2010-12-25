#import "AppController.h"
#import "MainWindowController.h"

@implementation AppController

- (void) awakeFromNib {
	mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindow"];
	[[mainWindowController window] makeMainWindow];
	[[mainWindowController window] makeKeyAndOrderFront:self];
	// register as observer for user closing window
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMainWindowWillClose:) name:NSWindowWillCloseNotification object:[mainWindowController window]];
}

- (void) dealloc {
	[mainWindowController release];
	[super dealloc];
}

- (void) handleMainWindowWillClose:(NSNotification*)_notification {
	// user pushed close button on window or pushed cmd-w
	[[NSNotificationCenter defaultCenter] removeObserver:self name:NSWindowWillCloseNotification object:[mainWindowController window]];
	[mainWindowController release];
	mainWindowController = nil;
	[NSApp terminate:self];
}

@end
