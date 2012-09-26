//
//  MotoSpeecMainCell.m
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/24/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "MotoSpeedMainCell.h"
#import "MotoSpeedConstants.h"

@implementation MotoSpeedMainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
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
    self.cellSubtitleLabel.text = [bikeObject objectForKey:kBikeSubtitleKey];
    self.cellImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpeg", [bikeObject objectForKey:kBikeImageKey]]];
    
}

@end
