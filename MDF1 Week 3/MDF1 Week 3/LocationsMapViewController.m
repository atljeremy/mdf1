//
//  SecondViewController.m
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "LocationsMapViewController.h"
#import "JFMapAnnotation.h"

#define kAnnotationViewReuseIdentifier @"annotationReuseIdentifier"

@implementation LocationsMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Locations Map", @"Locations Map");
        self.tabBarItem.image = [UIImage imageNamed:@"map-marker"];
        self.mapManager = [JFMapManager sharedInstance];
        self.locations  = [self.mapManager getLocations];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    [self.mapView addAnnotations:self.locations];
    
    [self.mapManager zoomToFitRegionForAnnotations:self.locations
                                         inMapView:self.mapView];

}

- (void)didReceiveMemoryWarning
{
    [self setMapManager:nil];
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
