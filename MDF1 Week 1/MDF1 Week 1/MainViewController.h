//
//  ViewController.h
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

@interface MainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

/**
 * Main UITableView used on the "home" screen to list all bikes
 */
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@end
