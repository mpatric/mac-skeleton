#import "MainViewController.h"
#import "Debug.h"

@implementation MainViewController

- (id) initWithNibName:(NSString*)_nibNameOrNil bundle:(NSBundle*)_nibBundleOrNil {
	LOGDEBUG(@"*** MainViewController.initWithNibName");
	if (self = [super initWithNibName:_nibNameOrNil bundle:_nibBundleOrNil]) {
	}
	return self;
}

- (void) viewDidLoad {
	LOGDEBUG(@"*** MainViewController.viewDidLoad");
}

@end
