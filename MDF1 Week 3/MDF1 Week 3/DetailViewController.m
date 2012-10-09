//
//  DetailViewController.m
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.mapManager = [JFMapManager sharedInstance];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /**
     * Sets the title in the nav bar
     */
    [self.navigationItem setTitle:@"Location Details"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.locationTitle.text = self.location.title;
    self.locationSubTitle.text = self.location.subtitle;
    self.mapView.userInteractionEnabled = NO;
    
    [self.mapManager zoomToFitRegionForAnnotation:self.location
                                        inMapView:self.mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
