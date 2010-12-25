#import "AppController.h"
#import "MainWindowController.h"

@implementation AppController

// This app controller simply manages the window controller of the main window.
// It releases the controller when the window is closed and makes a new one when the 
// user opens the window with cmd-1 keyboard short cut or by selecting "Main Window" in the Window menu	

- (void) awakeFromNib {
	// make the main window controller with main window nib file
	mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindow"];
	[[mainWindowController window] makeMainWindow];
	[[mainWindowController window] makeKeyAndOrderFront:self];
	// the app controller wants to know if the user closes the main window by hitting cmd-w or with the close button on the window it registers to get notified of this event
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMainWindowWillClose:) name:NSWindowWillCloseNotification object:[mainWindowController window]];
}

- (void) dealloc {
	[mainWindowController release];
	[super dealloc];
}

- (IBAction) toggleMainWindowOpen:(id)_sender {
	if(mainWindowController!=nil) {
		NSWindow * aMainWindow = [mainWindowController window];
		[aMainWindow performClose:self];
		[[NSNotificationCenter defaultCenter] removeObserver:self name:NSWindowWillCloseNotification object:aMainWindow];
		[mainWindowController release];
		mainWindowController = nil;
	} else {
		mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindow"];
		[[mainWindowController window] makeMainWindow];
		[[mainWindowController window] makeKeyAndOrderFront:self];
		// the app controller wants to know if the user closes the main window by hitting cmd-w or with the close button on the window it registers to get notified of this event
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMainWindowWillClose:) name:NSWindowWillCloseNotification object:[mainWindowController window]];
	}
}

- (void) handleMainWindowWillClose:(NSNotification*)_notification {
	// the window is closed by the user using cmd-w or the close button on the window
	[[NSNotificationCenter defaultCenter] removeObserver:self name:NSWindowWillCloseNotification object:[mainWindowController window]];
	[mainWindowController release];
	mainWindowController = nil;
}

- (BOOL) validateMenuItem:(NSMenuItem*)_menuItem {
	if ([_menuItem action] == @selector(toggleMainWindowOpen:)) {
		// make sure the menu item's state reflects whether the window is open or not
		if (mainWindowController != nil) {
			[_menuItem setState:1];
		} else {
			[_menuItem setState:0];
		}
		return YES;
	}
	return NO;
}

@end
