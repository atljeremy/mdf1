//
//  SocialNetworksViewController.m
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 10/2/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "SocialNetworksViewController.h"

@interface SocialNetworksViewController ()

@end

@implementation SocialNetworksViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)twitterSwitchValueChanged:(id)sender {
    UIAlertView* alert;
    if (self.twitterSwitch.on) {
        alert = [[UIAlertView alloc] initWithTitle:@"Twitter"
                                           message:@"Now Connected \n But not really : )"
                                          delegate:nil
                                 cancelButtonTitle:@"Dismiss"
                                 otherButtonTitles:nil];
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"Twitter"
                                           message:@"Now Disconnected"
                                          delegate:nil
                                 cancelButtonTitle:@"Dismiss"
                                 otherButtonTitles:nil];
    }
    
    [alert show];
}

- (IBAction)facebookSwitchValueChanged:(id)sender {
    UIAlertView* alert;
    if (self.facebookSwitch.on) {
        alert = [[UIAlertView alloc] initWithTitle:@"Facebook"
                                           message:@"Now Connected \n But not really : )"
                                          delegate:nil
                                 cancelButtonTitle:@"Dismiss"
                                 otherButtonTitles:nil];
    } else {
        alert = [[UIAlertView alloc] initWithTitle:@"Facebook"
                                           message:@"Now Disconnected"
                                          delegate:nil
                                 cancelButtonTitle:@"Dismiss"
                                 otherButtonTitles:nil];
    }
    
    [alert show];
}

@end
