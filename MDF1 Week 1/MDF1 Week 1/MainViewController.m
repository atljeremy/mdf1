//
//  ViewController.m
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/24/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "MainViewController.h"
#import "MotoSpeedMainCell.h"

#define kMainCellIdentifier @"MainCell"
#define kBikesObjectKey @"bikes"
#define kTotalRecordsKey @"total_records"

@interface MainViewController () {
    NSNumber*     total_records;
    NSArray*      bikesArray;
    NSDictionary* bikeJSON;
}

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    
    if (cell == nil) {
        cell = [[MotoSpeedMainCell alloc] initWithStyle:UITableViewCellStyleDefault
                                        reuseIdentifier:kMainCellIdentifier];
    }
    
    [cell configureCellWithBikeObject:currentBike];
    
    return cell;
}

@end
