//
//  ViewController.m
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/24/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "MainViewController.h"
#import "MotoSpeedMainCell.h"
#import "MotoSpeedConstants.h"
#import "DetailViewController.h"

@interface MainViewController () {
    NSNumber*     total_records;
    NSArray*      bikesArray;
    NSDictionary* bikeJSON;
}

@end

@implementation MainViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationItem setTitle:@"MotoSpeed"];
    
    UIBarButtonItem* edit = [[UIBarButtonItem alloc] initWithTitle:@"edit"
                                                             style:UIBarButtonSystemItemEdit
                                                            target:self
                                                            action:@selector(editList)];
    self.navigationItem.rightBarButtonItem = edit;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.mainTableView registerNib:[UINib nibWithNibName:@"MotoSpeedMainCell" bundle:nil] forCellReuseIdentifier:@"MainCell"];
    
    NSError*  error;
    NSString* dataPath = [NSString stringWithFormat:@"%@/bikes.json", [[NSBundle mainBundle] resourcePath]];
    NSData*   bikeData = [NSData dataWithContentsOfFile:dataPath];
    bikeJSON      = [NSJSONSerialization JSONObjectWithData:bikeData options:kNilOptions error:&error];
    bikesArray    = [bikeJSON objectForKey:kBikesObjectKey];
    total_records = [bikeJSON objectForKey:kTotalRecordsKey];
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
    return [total_records intValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary* currentBike = [bikesArray objectAtIndex:indexPath.row];
    
    MotoSpeedMainCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainCellIdentifier];
    
    [cell configureCellWithBikeObject:currentBike];
    
    return cell;
}

#pragma mark - UITableViewDelegate Optional Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMainCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary* currentBike = [bikesArray objectAtIndex:indexPath.row];
    
    DetailViewController* detailVC = [[DetailViewController alloc] initWithNibName:kDetailVCNib bundle:nil];
    detailVC.bikeObject = currentBike;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark - Custom Methods

- (void)editList {
    if (!self.mainTableView.editing) {
        [self.mainTableView setEditing:YES animated:YES];
    } else {
        [self.mainTableView setEditing:NO animated:YES];
    }

}

@end
