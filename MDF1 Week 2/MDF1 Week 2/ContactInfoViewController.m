//
//  ContactInfoViewController.m
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 10/2/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "ContactInfoViewController.h"

#define kNameFieldKey  @"nameFieldKey"
#define kEmailFieldKey @"emailFieldKey"

@interface ContactInfoViewController ()

@end

@implementation ContactInfoViewController

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
    
    self.nameField.delegate  = self;
    self.emailField.delegate = self;
    
    NSString* savedName = [[NSUserDefaults standardUserDefaults] objectForKey:kNameFieldKey];
    NSString* savedEmail = [[NSUserDefaults standardUserDefaults] objectForKey:kEmailFieldKey];
    if (savedName) {
        self.nameField.text = savedName;
    }
    if (savedEmail) {
        self.emailField.text = savedEmail;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearBtnClicked:(id)sender {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kNameFieldKey];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kEmailFieldKey];
    self.nameField.text = @"";
    self.emailField.text = @"";
}

- (IBAction)saveBtnClicked:(id)sender {
    if ([self.nameField.text length] > 0 && [self.emailField.text length] > 0) {
        [[NSUserDefaults standardUserDefaults] setObject:self.nameField.text forKey:kNameFieldKey];
        [[NSUserDefaults standardUserDefaults] setObject:self.emailField.text forKey:kEmailFieldKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[[UIAlertView alloc] initWithTitle:@"Saved"
                                   message:@"Your Information Has Been Saved."
                                  delegate:nil
                         cancelButtonTitle:@"Dismiss"
                         otherButtonTitles:nil] show];
        [self.nameField resignFirstResponder];
        [self.emailField resignFirstResponder];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Not Saved"
                                    message:@"Please enter your Name and Email address before saving."
                                   delegate:nil
                          cancelButtonTitle:@"Dismiss"
                          otherButtonTitles:nil] show];
    }
}
@end
