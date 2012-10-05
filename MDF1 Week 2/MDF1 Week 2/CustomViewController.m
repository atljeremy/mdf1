//
//  CustomViewController.m
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 9/30/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "CustomViewController.h"
#import "MotoSpeedAnnotation.h"

#define kAnnotationViewReuseIdentifier @"mapAnnotationIdentifier"

@interface CustomViewController ()

@end

@implementation CustomViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Meetup Map", @"Meetup Map");
        self.tabBarItem.image = [UIImage imageNamed:@"map-marker"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.mapView.delegate = self;
    
    //create annotations and add to the array
    NSMutableArray* locations = [NSMutableArray array];
	CLLocationCoordinate2D annotationCenter;
	MotoSpeedAnnotation *annotation;
	
	annotationCenter.latitude = 33.7489;
	annotationCenter.longitude =  -84.3881;
	annotation = [[MotoSpeedAnnotation alloc] initWithCoordinate:annotationCenter
                                                       withTitle:@"Location: Atlanta, GA"
                                                    withSubtitle:@"Meetup Date: 12/20/2012"];
	[locations addObject:annotation];
	
	annotationCenter.latitude = 34.0753;
	annotationCenter.longitude =  -84.2942;
	annotation = [[MotoSpeedAnnotation alloc] initWithCoordinate:annotationCenter
                                                       withTitle:@"Location: Alparetta, GA"
                                                    withSubtitle:@"Meetup Date: 01/12/2013"];
	[locations addObject:annotation];
	
	annotationCenter.latitude = 34.0231;
	annotationCenter.longitude =  -84.3617;
	annotation = [[MotoSpeedAnnotation alloc] initWithCoordinate:annotationCenter
                                                       withTitle:@"Location: Roswell, GA"
                                                    withSubtitle:@"Meetup Date: 12/02/2012"];
	[locations addObject:annotation];
	
	annotationCenter.latitude = 33.8583;
	annotationCenter.longitude =  -84.0064;
	annotation = [[MotoSpeedAnnotation alloc] initWithCoordinate:annotationCenter
                                                       withTitle:@"Location: Snellville, GA"
                                                    withSubtitle:@"Meetup Date: 02/13/2013"];
	[locations addObject:annotation];
    
    annotationCenter.latitude = 33.9608;
	annotationCenter.longitude =  -83.3781;
	annotation = [[MotoSpeedAnnotation alloc] initWithCoordinate:annotationCenter
                                                       withTitle:@"Location: Athens, GA"
                                                    withSubtitle:@"Meetup Date: 02/15/2013"];
	[locations addObject:annotation];
    
    [self.mapView removeAnnotations:self.mapView.annotations];
    [self.mapView addAnnotations:locations];
    [self zoomToFitRegionForAnnotations:locations inMapView:self.mapView];
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
    
    annoView.image = [UIImage imageNamed:@"moto_map_pin"];
    
    annoView.canShowCallout = YES;
    
    return annoView;
}

#pragma mark - Custom Methods

- (void)zoomToFitRegionForAnnotations:(NSArray*)annotations inMapView:(MKMapView*)mapView {
    
    MKCoordinateRegion region = [self calculateRegion:annotations];
    [mapView setRegion:[mapView regionThatFits:region] animated:YES];
}

- (MKCoordinateRegion)calculateRegion:(NSArray *)annotations {
    if ([annotations count] == 0) return MKCoordinateRegionMake(CLLocationCoordinate2DMake(0, 0), MKCoordinateSpanMake(0, 0));
    
    if ([annotations count] == 1) {
        id<MKAnnotation> annotation = [annotations objectAtIndex:0];
        MKCoordinateRegion region;
        if (annotation) {
            region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(annotation.coordinate.latitude, annotation.coordinate.longitude),
                                            MKCoordinateSpanMake(0.1, 0.1));
        }
        return region;
    }
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(id<MKAnnotation> annotation in annotations) {
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.2;
    
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.2;
    
    return region;
}


@end
