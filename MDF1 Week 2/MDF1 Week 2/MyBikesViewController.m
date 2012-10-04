//
//  MyBikesViewController.m
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 10/2/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "MyBikesViewController.h"

#define kBikesFieldKey @"bikesFieldKey"

@interface MyBikesViewController ()

@end

@implementation MyBikesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.bikesField.delegate = self;
    
    NSString* savedBikes = [[NSUserDefaults standardUserDefaults] objectForKey:kBikesFieldKey];
    if (savedBikes) {
        self.bikesField.text = savedBikes;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearBtnClicked:(id)sender {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kBikesFieldKey];
    self.bikesField.text = @"";
}

- (IBAction)saveBtnClicked:(id)sender {
    if ([self.bikesField.text length] > 0) {
        [[NSUserDefaults standardUserDefaults] setObject:self.bikesField.text forKey:kBikesFieldKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[[UIAlertView alloc] initWithTitle:@"Saved"
                                    message:@"Your Information Has Been Saved."
                                   delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil] show];
        [self.bikesField resignFirstResponder];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Not Saved"
                                    message:@"Please enter your bikes before saving."
                                   delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil] show];
    }

}

@end
