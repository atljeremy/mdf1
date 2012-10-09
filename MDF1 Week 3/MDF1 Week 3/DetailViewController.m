//
//  DetailViewController.m
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "DetailViewController.h"

#define kAnnotationViewReuseIdentifier @"annotationReuseIdentifier"

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

    self.mapView.delegate      = self;
    self.locationTitle.text    = self.location.title;
    self.locationSubTitle.text = self.location.subtitle;
    self.locationPhone.text    = self.location.phone;
    self.locationCoords.text   = [NSString stringWithFormat:@"Latitude: %f Longitude: %f",
                                  self.location.coordinate.latitude,
                                  self.location.coordinate.longitude];
    
    [self.mapView addAnnotation:self.location];
    [self.mapManager zoomToFitRegionForAnnotation:self.location
                                        inMapView:self.mapView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - MKMapViewDelegate Methods

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[MKUserLocation class]]) return nil;
    
    MKPinAnnotationView* annoView = (MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:kAnnotationViewReuseIdentifier];
    
    if (!annoView) {
        annoView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kAnnotationViewReuseIdentifier];
    } else {
        annoView.annotation = annotation;
    }
    
    annoView.image = [UIImage imageNamed:@"map_pin"];
    
    annoView.canShowCallout = YES;
    
    return annoView;
}


@end
