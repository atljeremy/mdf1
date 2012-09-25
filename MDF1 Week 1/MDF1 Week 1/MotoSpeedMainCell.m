//
//  MotoSpeecMainCell.m
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/24/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "MotoSpeedMainCell.h"

#define kBikeTitleKey @"bike_title"

@implementation MotoSpeedMainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.cellTitleLabel    = [[UILabel alloc] init];
        self.cellSubtitleLabel = [[UILabel alloc] init];
        self.cellImageView     = [[UIImageView alloc] init];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellWithBikeObject:(NSDictionary*)bikeObject {
    
    
    self.cellTitleLabel.text = [bikeObject objectForKey:kBikeTitleKey];
    
    NSLog(@"%@", self.cellTitleLabel.text);
    
}

@end
