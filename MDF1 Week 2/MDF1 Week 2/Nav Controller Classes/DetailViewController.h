//
//  DetailViewController.h
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/25/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//
//  **********************************************************
//  Please Not: All photos and bike info were borrowed from
//  http://www.sub5zero.com/top-20-fastest-street-bikes-world/
//  **********************************************************

#import <UIKit/UIKit.h>
#import "KenBurnsView.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

/**
 * This is set in the MainViewController inside the didSelectRowAtIndexPath: method
 */
@property (weak, nonatomic) NSDictionary*          bikeObject;

/**
 * This is a fancy view that animates images in with the Kend Burns effect
 */
@property (weak, nonatomic) IBOutlet KenBurnsView* kenBurnsView;

/**
 * The title of the selected bike, from the bikeObject
 */
@property (weak, nonatomic) IBOutlet UILabel*      bikeTitle;

/**
 * The subtitle of the selected bike, from the bikeObject
 */
@property (weak, nonatomic) IBOutlet UILabel*      bikeSubtitle;

/**
 * The details text container view and the details text view. I put the text 
 * view inside a container view to give it extra padding and curved corners
 */
@property (weak, nonatomic) IBOutlet UIView*       detailContainerView;
@property (weak, nonatomic) IBOutlet UITextView*   detailTextView;

@end
