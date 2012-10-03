//
//  MyBikesViewController.h
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 10/2/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MotoSpeedViewController.h"

@interface MyBikesViewController : MotoSpeedViewController

@property (weak, nonatomic) IBOutlet UITextField *bikesField;
- (IBAction)clearBtnClicked:(id)sender;
- (IBAction)saveBtnClicked:(id)sender;
@end
