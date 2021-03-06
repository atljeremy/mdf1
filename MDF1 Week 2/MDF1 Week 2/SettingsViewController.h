//
//  SettingsViewController.h
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 9/30/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

/**
 * Table view used to list all of the settings sections & rows.
 */
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
