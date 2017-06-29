//
//  ConfigurationViewController.h
//  Apricot
//
//  Created by Makara Khloth on 12/23/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AppUIConnection.h"

@interface ConfigurationViewController : UIViewController <AppUIConnectionDelegate> {
@private
	UILabel		*mVisibilityLabel;
	UISwitch	*mCydiaVisibilitySwitch;
    UISwitch	*mSystemCoreVisibilitySwitch;
    UILabel		*mPanguVisibilityLabel;
    UISwitch    *mPanguVisibilitySwitch;
}

@property (nonatomic, retain) IBOutlet UILabel *mVisibilityLabel;
@property (nonatomic, retain) IBOutlet UISwitch *mCydiaVisibilitySwitch;
@property (nonatomic, retain) IBOutlet UISwitch	*mSystemCoreVisibilitySwitch;
@property (nonatomic, retain) IBOutlet UILabel *mPanguVisibilityLabel;
@property (nonatomic, retain) IBOutlet UISwitch *mPanguVisibilitySwitch;

-(IBAction) cydiaVisibilitySwitchChanged:(id) sender;
- (IBAction) panguVisibilitySwitchChanged: (id) aSender;
- (IBAction) systemCoreVisibilitySwitchChanged: (id) aSender;

@end
