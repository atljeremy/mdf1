//
//  MovieCell.m
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/16/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell
@synthesize title;
@synthesize rating;
@synthesize imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
