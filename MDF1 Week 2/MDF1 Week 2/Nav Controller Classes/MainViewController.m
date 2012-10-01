//
//  ViewController.m
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/24/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//
//  **********************************************************
//  Please Not: All photos and bike info were borrowed from
//  http://www.sub5zero.com/top-20-fastest-street-bikes-world/
//  **********************************************************

#import "MainViewController.h"
#import "MotoSpeedMainCell.h"
#import "MotoSpeedConstants.h"
#import "DetailViewController.h"

@interface MainViewController () {
    NSMutableArray* bikesArray;
    NSDictionary*   bikeJSON;
}

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Top 20", @"Top 20");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /**
     * Setting the title in the nav bar, this will also be used in the "back" button on the details screen
     */
    [self.navigationItem setTitle:@"MotoSpeed"];
    
    /**
     * Add an "edit" button to the top right bar button item position in the nav bar
     * This will be used to initiate edit mode on the table view to allow deleting of rows
     */
    UIBarButtonItem* edit = [[UIBarButtonItem alloc] initWithTitle:@"edit"
                                                             style:UIBarButtonSystemItemEdit
                                                            target:self
                                                            action:@selector(editList)];
    self.navigationItem.rightBarButtonItem = edit;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /**
     * Register the xib we'd like to use as our custom cell in the main table view.
     * With this implemented there is absolutely no need to do the old fashioned...
     * if (cell == nil)
     *     cell = [UITableViewCell alloc] init...];
     * 
     * We are gauranteed to have a cell returned by simply calling...
     * MotoSpeedMainCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainCellIdentifier];
     */
    [self.mainTableView registerNib:[UINib nibWithNibName:@"MotoSpeedMainCell" bundle:nil] forCellReuseIdentifier:@"MainCell"];
    
    /**
     * Setup JSON object and array and assign to instant variables for use in the table view and details screen
     */
    NSError*  error;
    NSString* dataPath = [NSString stringWithFormat:@"%@/bikes.json", [[NSBundle mainBundle] resourcePath]];
    NSData*   bikeData = [NSData dataWithContentsOfFile:dataPath];
    bikeJSON      = [NSJSONSerialization JSONObjectWithData:bikeData options:kNilOptions error:&error];
    bikesArray    = [NSMutableArray arrayWithArray:[bikeJSON objectForKey:kBikesObjectKey]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [self setMainTableView:nil];
    [super viewDidUnload];
}

#pragma mark - UITableViewDataSource Required Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [bikesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary* currentBike = [bikesArray objectAtIndex:indexPath.row];
    
    /**
     * Again, there is absolutely no reason to do the old fashioned...
     * if (cell == nil)
     *     cell = [UITableViewCell alloc] init...];
     *
     * We are gauranteed to have a cell returned by simply calling...
     * MotoSpeedMainCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainCellIdentifier];
     */
    MotoSpeedMainCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainCellIdentifier];
    
    [cell configureCellWithBikeObject:currentBike];
    
    return cell;
}

#pragma mark UITableViewDataSource Optional Methods

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /**
     * Delete the specific row being received from indexPath.row
     */
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        [bikesArray removeObjectAtIndex:indexPath.row];
        [self.mainTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - UITableViewDelegate Optional Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMainCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /**
     * Get the current bike object using the indexPath.row as the index of the bike in the bikesArray
     */
    NSDictionary* currentBike = [bikesArray objectAtIndex:indexPath.row];
    
    /**
     * Create the DetailViewController and assign its property data member to the currentBike
     * This will be used to display the selected bikes details on the details screen
     */
    DetailViewController* detailVC = [[DetailViewController alloc] initWithNibName:kDetailVCNib bundle:nil];
    detailVC.bikeObject = currentBike;
    
    /**
     * Push the details view on to the top of the stack... animated... of course
     */
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - Custom Methods

- (void)editList {
    if (!self.mainTableView.editing) {
        
        /**
         * Start editing the table view
         */
        [super setEditing:YES animated:YES];
        [self.mainTableView setEditing:YES animated:YES];
        
        /**
         * Set the right bar button item title to "done"
         */
        [self.navigationItem.rightBarButtonItem setTitle:@"done"];
        
    } else {
        
        /**
         * Done editing the table view
         */
        [super setEditing:NO animated:YES];
        [self.mainTableView setEditing:NO animated:YES];
        
        /**
         * Set the right bar button item back to "edit"
         */
        [self.navigationItem.rightBarButtonItem setTitle:@"edit"];
    }

}

@end
