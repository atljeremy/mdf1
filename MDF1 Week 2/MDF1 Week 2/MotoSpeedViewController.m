//
//  MotoSpeedViewController.m
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 10/2/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "MotoSpeedViewController.h"

@interface MotoSpeedViewController ()

@end

@implementation MotoSpeedViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom IBActions

- (IBAction)doneBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldsDelegate Optional Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
