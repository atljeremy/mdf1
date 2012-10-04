//
//  SocialNetworksViewController.h
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 10/2/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MotoSpeedViewController.h"

@interface SocialNetworksViewController : MotoSpeedViewController

@property (weak, nonatomic) IBOutlet UISwitch *twitterSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *facebookSwitch;
- (IBAction)twitterSwitchValueChanged:(id)sender;
- (IBAction)facebookSwitchValueChanged:(id)sender;
@end
