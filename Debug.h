#import <Cocoa/Cocoa.h>
#import "Environment.h"

#ifdef _DEBUG_

#define LOGDEBUG(__msg__) (NSLog(__msg__))

#else

#define LOGDEBUG(__msg__)

#endif