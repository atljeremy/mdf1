//
//  DetailViewController.m
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/25/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//
//  **********************************************************
//  Please Not: All photos and bike info were borrowed from
//  http://www.sub5zero.com/top-20-fastest-street-bikes-world/
//  **********************************************************

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
    
    /**
     * Sets the title in the nav bar
     */
    [self.navigationItem setTitle:@"Bike Details"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     * Create an array using the bike photo to display in the KenBurnsView
     */
    NSArray *bikeImageArray = [NSArray arrayWithObject:
                               [UIImage imageNamed:
                                [NSString stringWithFormat:@"%@.jpeg",
                                 [self.bikeObject objectForKey:kBikeImageKey]]]];
    
    /**
     * Telling the KenBurnsView to begin animating with the bike photo.
     * It will show each annimation for 15 seconds and loop forever.
     */
    [self.kenBurnsView animateWithImages:bikeImageArray
                      transitionDuration:15
                                    loop:YES
                             isLandscape:YES];
    
    /**
     * Setting the text values for details page labels and text view
     */
    self.bikeTitle.text = [self.bikeObject objectForKey:kBikeTitleKey];
    self.bikeSubtitle.text = [self.bikeObject objectForKey:kBikeSubtitleKey];
    self.detailTextView.text = [self.bikeObject objectForKey:kBikeDetailKey];
    
    /**
     * Giving the details text view container view curved corners and border
     */
    self.detailContainerView.layer.cornerRadius = 10;
    self.detailContainerView.layer.borderWidth  = 1;
    self.detailContainerView.layer.borderColor  = [[UIColor grayColor] CGColor];
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
