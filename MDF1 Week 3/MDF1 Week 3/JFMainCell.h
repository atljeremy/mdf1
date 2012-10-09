//
//  JFMainCell.h
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFMapAnnotation.h"

@interface JFMainCell : UITableViewCell

- (void)configureCellWithLocation:(JFMapAnnotation*)location;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *subTitle;

@end
