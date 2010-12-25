#import "PreferencesView.h"
#import "Debug.h"

@implementation PreferencesView

- (id) initWithFrame:(NSRect)_aframe {
	LOGDEBUG(@"*** PreferencesView.initWithFrame");
    self = [super initWithFrame:_aframe];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void) drawRect:(NSRect)_dirtyRect {
    // Drawing code here.
}

-(BOOL)acceptsFirstResponder {
	return YES;
}

@end
