//
//  MotoSpeedViewController.h
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 10/2/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * Base class extended by all ViewController classes in the 
 * Settings tab except the SettingsViewController itself.
 * This was used because I didn't want to have to reimplement the 
 * Done button action over and over for each View Controller.
 */
@interface MotoSpeedViewController : UIViewController <UITextFieldDelegate>

/**
 * IBAction used to wire up each of the "Done" bar button items in the 
 * modally presented view controllers in the settings tab.
 */
- (IBAction)doneBtnClicked:(id)sender;
@end
