//
//  MotoSpeecMainCell.h
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/24/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//
//  **********************************************************
//  Please Not: All photos and bike info were borrowed from
//  http://www.sub5zero.com/top-20-fastest-street-bikes-world/
//  **********************************************************

#import <UIKit/UIKit.h>

@interface MotoSpeedMainCell : UITableViewCell

/**
 * Properties used for the title, subtitle and image in this custom cell
 */
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellSubtitleLabel;

/**
 * Method to be used in cellForRowAtIndexPath: in the MainViewController to configure each cell
 */
- (void)configureCellWithBikeObject:(NSDictionary*)bikeObject;

@end
