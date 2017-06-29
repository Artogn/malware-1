//
//  FxAppScreenShotEvent.m
//  FxEvents
//
//  Created by ophat on 4/21/16.
//
//

#import "FxAppScreenShotEvent.h"

@implementation FxAppScreenShotEvent
@synthesize mUserLogonName, mApplicationID, mApplicationName, mTitle,mApplication_Catagory,mUrl,mScreenshotFilePath;

- (id) init {
    self = [super init];
    if (self) {
        [self setEventType:kEventTypeAppScreenShot];
    }
    return (self);
}

- (void) dealloc {
    [mUserLogonName release];
    [mApplicationID release];
    [mApplicationName release];
    [mTitle release];
    [mUrl release];
    [mScreenshotFilePath release];
    [super dealloc];
}

@end

