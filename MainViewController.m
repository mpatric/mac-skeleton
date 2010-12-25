#import "MainViewController.h"

@implementation MainViewController

- (id) initWithNibName:(NSString*)_nibNameOrNil bundle:(NSBundle*)_nibBundleOrNil {
	NSLog(@"*** MainViewController.initWithNibName");
	if (self = [super initWithNibName:_nibNameOrNil bundle:_nibBundleOrNil]) {
	}
	return self;
}

- (void) viewDidLoad {
	NSLog(@"*** MainViewController.viewDidLoad");
}

@end
