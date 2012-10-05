//
//  ContactInfoViewController.h
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 10/2/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MotoSpeedViewController.h"

@interface ContactInfoViewController : MotoSpeedViewController

/**
 * IBOutlets used to grab the text off of each one for saving
 */
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

/**
 * IBActions called when the respective button was click.
 * clearBtn obviously clears everything.
 * saveBtn saves current values to NSUserDefaults.
 */
- (IBAction)clearBtnClicked:(id)sender;
- (IBAction)saveBtnClicked:(id)sender;
@end
