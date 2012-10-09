//
//  FirstViewController.m
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "LocationsListViewController.h"
#import "JFMainCell.h"
#import "JFMapAnnotation.h"
#import "DetailViewController.h"

#define kCellHeight 85
#define kMainCellIdentifier @"mainCellIdentifier"
#define kMainCellNib @"JFMainCell"
#define kDetailVCNib @"DetailViewController"

@implementation LocationsListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Fox Photography", @"Fox Photography");
        self.tabBarItem.image = [UIImage imageNamed:@"map-marker"];
        self.mapManager = [JFMapManager sharedInstance];
        self.locations = [self.mapManager getLocations];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self.tableView registerNib:[UINib nibWithNibName:kMainCellNib bundle:nil] forCellReuseIdentifier:kMainCellIdentifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableViewDataSource Required Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.locations count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JFMapAnnotation* currentLocation = [self.locations objectAtIndex:indexPath.row];
    
    /**
     * Again, there is absolutely no reason to do the old fashioned...
     * if (cell == nil)
     *     cell = [UITableViewCell alloc] init...];
     *
     * We are gauranteed to have a cell returned by simply calling...
     * JFMainCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainCellIdentifier];
     */
    JFMainCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainCellIdentifier];
    
    [cell configureCellWithLocation:currentLocation];
    
    return cell;
}

#pragma mark UITableViewDataSource Optional Methods

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /**
     * Delete the specific row being received from indexPath.row
     */
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [self.locations removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - UITableViewDelegate Optional Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /**
     * Get the current bike object using the indexPath.row as the index of the bike in the bikesArray
     */
    JFMapAnnotation* currentLocation = [self.locations objectAtIndex:indexPath.row];
    
    /**
     * Create the DetailViewController and assign its property data member to the currentBike
     * This will be used to display the selected bikes details on the details screen
     */
    DetailViewController* detailVC = [[DetailViewController alloc] initWithNibName:kDetailVCNib bundle:nil];
    detailVC.location = currentLocation;
    
    /**
     * Push the details view on to the top of the stack... animated... of course
     */
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - Custom Methods
- (void)editList {
    if (!self.tableView.editing) {
        
        /**
         * Start editing the table view
         */
        [super setEditing:YES animated:YES];
        [self.tableView setEditing:YES animated:YES];
        
        /**
         * Set the right bar button item title to "done"
         */
        [self.navigationItem.rightBarButtonItem setTitle:@"done"];
        
    } else {
        
        /**
         * Done editing the table view
         */
        [super setEditing:NO animated:YES];
        [self.tableView setEditing:NO animated:YES];
        
        /**
         * Set the right bar button item back to "edit"
         */
        [self.navigationItem.rightBarButtonItem setTitle:@"edit"];
    }
    
}


@end
