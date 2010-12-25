#import "AppController.h"
#import "MainWindowController.h"
#import "PreferencesWindowController.h"
#import "Consts.h"
#import "Debug.h"

#define KEY_VERSION @"version"
#define KEY_WINDOWX @"windowx"
#define KEY_WINDOWY @"windowy"

@interface AppController(PrivateMethods)
- (void) defaultUserSettings;
- (void) loadUserSettings;
- (void) saveUserSettings;
@end

@implementation AppController

- (id) init {
	// environment warnings
	char* szZombieEnabled = getenv("NSZombieEnabled");
	if (szZombieEnabled) {
		NSLog(@"WARNING! NSZombieEnabled is set (value = %s)", szZombieEnabled);
	}
	self = [super init];
    if (self) {
		preferencesWindowController = nil;
		[self defaultUserSettings];
    }
	return self;
}

- (void) awakeFromNib {
	mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindow"];
	[[mainWindowController window] makeMainWindow];
	[[mainWindowController window] makeKeyAndOrderFront:self];
	// register as observer for user closing main window
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleMainWindowWillClose:) name:NSWindowWillCloseNotification object:[mainWindowController window]];
	[self loadUserSettings];
}

- (void) dealloc {
	[preferencesWindowController release];
	[mainWindowController release];
	[super dealloc];
}

- (void) handleMainWindowWillClose:(NSNotification*)_notification {
	[self saveUserSettings];
	// user pushed close button on window or pushed cmd-w
	[[NSNotificationCenter defaultCenter] removeObserver:self name:NSWindowWillCloseNotification object:[mainWindowController window]];
	[NSApp terminate:self];
}

- (IBAction) orderFrontPreferencesWindow:(id)_sender {
	if (preferencesWindowController == nil) {
		preferencesWindowController = [[PreferencesWindowController alloc] initWithWindowNibName:@"PreferencesWindow"];
		[[preferencesWindowController window] makeMainWindow];
		[[preferencesWindowController window] makeKeyAndOrderFront:self];
		NSRect mainFrame = [[mainWindowController window] frame];
		NSRect prefFrame = [[preferencesWindowController window] frame];
		[[preferencesWindowController window] setFrameOrigin:NSMakePoint(
			mainFrame.origin.x + (mainFrame.size.width - prefFrame.size.width)/2,
			mainFrame.origin.y + (mainFrame.size.height - prefFrame.size.height)/2)];
	} else {
		[preferencesWindowController showWindow:nil];
	}
}

- (void) defaultUserSettings {
	NSNumber* defaultVersion = [[NSNumber numberWithInt:1] retain];
	NSNumber* defaultWindowX = [[NSNumber numberWithInt:0] retain];
	NSNumber* defaultWindowY = [[NSNumber numberWithInt:200] retain];
	NSDictionary* applicationDefaults = [NSDictionary
		dictionaryWithObjects:[NSArray arrayWithObjects:defaultVersion, defaultWindowX, defaultWindowY, nil]
		forKeys:[NSArray arrayWithObjects:KEY_VERSION, KEY_WINDOWX, KEY_WINDOWY, nil]];
	[[NSUserDefaults standardUserDefaults] registerDefaults:applicationDefaults];
	[defaultWindowY release];
	[defaultWindowX release];
	[defaultVersion release];
}

- (void) loadUserSettings {
	//int loadedVersion = [[NSUserDefaults standardUserDefaults] integerForKey:KEY_VERSION];
	int loadedWindowX = [[NSUserDefaults standardUserDefaults] integerForKey:KEY_WINDOWX];
	int loadedWindowY = [[NSUserDefaults standardUserDefaults] integerForKey:KEY_WINDOWY];
	[[mainWindowController window] setFrameOrigin:NSMakePoint(loadedWindowX, loadedWindowY)];
}

- (void) saveUserSettings {
	NSRect frame = [[mainWindowController window] frame];
	[[NSUserDefaults standardUserDefaults] setInteger:CURRENT_VERSION forKey:KEY_VERSION];
	[[NSUserDefaults standardUserDefaults] setInteger:frame.origin.x forKey:KEY_WINDOWX];
	[[NSUserDefaults standardUserDefaults] setInteger:frame.origin.y forKey:KEY_WINDOWY];
	[[NSUserDefaults standardUserDefaults] synchronize];
}

@end
