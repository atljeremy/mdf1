//
//  DetailViewController.m
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/25/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "DetailViewController.h"
#import "MotoSpeedConstants.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationItem setTitle:@"Bike Details"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *bikeImageArray = [NSArray arrayWithObject:
                               [UIImage imageNamed:
                                [NSString stringWithFormat:@"%@.jpeg",
                                 [self.bikeObject objectForKey:kBikeImageKey]]]];
    
    [self.kenBurnsView animateWithImages:bikeImageArray
                      transitionDuration:15
                                    loop:YES
                             isLandscape:YES];
    
    self.bikeTitle.text = [self.bikeObject objectForKey:kBikeTitleKey];
    self.bikeSubtitle.text = [self.bikeObject objectForKey:kBikeSubtitleKey];
    self.detailTextView.text = [self.bikeObject objectForKey:kBikeDetailKey];
    
    self.detailContainerView.layer.cornerRadius = 10;
    self.detailContainerView.layer.borderWidth  = 1;
    self.detailContainerView.layer.borderColor  = [[UIColor grayColor] CGColor];
    self.detailContainerView.layer.shadowColor  = [[UIColor blackColor] CGColor];
    self.detailContainerView.layer.shadowOffset = CGSizeMake(1,1);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [self setBikeObject:nil];
}

- (void)viewDidUnload {
    [self setKenBurnsView:nil];
    [self setBikeTitle:nil];
    [self setBikeSubtitle:nil];
    [self setDetailContainerView:nil];
    [self setDetailTextView:nil];
    [super viewDidUnload];
}

@end
