//
//  DetailViewController.h
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/25/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KenBurnsView.h"

@interface DetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) NSDictionary*          bikeObject;
@property (weak, nonatomic) IBOutlet KenBurnsView* kenBurnsView;
@property (weak, nonatomic) IBOutlet UILabel*      bikeTitle;
@property (weak, nonatomic) IBOutlet UILabel*      bikeSubtitle;
@property (weak, nonatomic) IBOutlet UIView*       detailContainerView;
@property (weak, nonatomic) IBOutlet UITextView*   detailTextView;

@end
