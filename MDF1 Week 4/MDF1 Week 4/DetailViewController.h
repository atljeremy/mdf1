//
//  DetailViewController.h
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/17/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (weak, nonatomic) NSDictionary* movie;
@property (weak, nonatomic) IBOutlet UIImageView *thumb;
@property (weak, nonatomic) IBOutlet UILabel *movieTitle;
@property (weak, nonatomic) IBOutlet UILabel *movieRating;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
