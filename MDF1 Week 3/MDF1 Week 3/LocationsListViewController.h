//
//  FirstViewController.h
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFMapManager.h"

/**
 * LocationsListViewController
 *
 * This is the class used to display a list of all locations
 */
@interface LocationsListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView* tableView;
@property (nonatomic, weak) NSMutableArray*       locations;
@property (nonatomic, weak) JFMapManager*         mapManager;

@end
