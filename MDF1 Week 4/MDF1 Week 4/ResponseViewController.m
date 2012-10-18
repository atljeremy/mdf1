//
//  ResponseViewController.m
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/15/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//
//  Web Service URL: http://itunes.apple.com/search?term=steven+spielberg&media=movie&entity=movie&attribute=producerTerm&limit=20
//  Web Service Information: http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html

#import "ResponseViewController.h"

@interface ResponseViewController ()

@end

@implementation ResponseViewController
@synthesize responseTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Full Response", @"Full Response");
        self.tabBarItem.image = [UIImage imageNamed:@"json_icon"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.responseString) {
        [self showLoadingLabel];
    } else {
        [self showResponseTextViewAnmiated:NO];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods

- (void)showLoadingLabel {
    self.responseTextView.alpha  = 0.0;
    self.responseTextView.hidden = YES;
    self.loadingView.alpha  = 1.0;
    self.loadingView.hidden = NO;
    [self.activityIndicator startAnimating];
}

- (void)showResponseTextViewAnmiated:(BOOL)animated {
    
    self.responseTextView.text = self.responseString;
    
    if (animated) {
        [UIView animateWithDuration:0.5 animations:^{
            self.loadingView.alpha = 0.0;
            self.responseTextView.hidden = NO;
            self.responseTextView.alpha  = 1.0;
        }
        completion:^(BOOL finished){
            self.loadingView.hidden = YES;
            [self.activityIndicator stopAnimating];
        }];
    } else {
        self.responseTextView.alpha  = 1.0;
        self.responseTextView.hidden = NO;
        self.loadingView.alpha  = 0.0;
        self.loadingView.hidden = YES;
    }
}

#pragma mark - Public Methods

- (void)setResponseText:(NSString*)responseText {
    if (![self.responseString isEqualToString:responseText]) {
        self.responseString = nil;
    }
    self.responseString = responseText;
    [self showResponseTextViewAnmiated:NO];
}

@end
