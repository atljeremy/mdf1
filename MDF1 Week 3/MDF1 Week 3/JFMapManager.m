//
//  JFMapManager.m
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMapManager.h"
#import "JFMapAnnotation.h"

@implementation JFMapManager
@synthesize locations = _locations;

- (id)init {
    if (self = [super init]) {
        _locations = [NSMutableArray array];
    }
    return self;
}

- (void)zoomToFitRegionForAnnotation:(id<MKAnnotation>)annotation inMapView:(MKMapView*)mapView {
    
    MKCoordinateRegion region;
    if (annotation) {
        region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(annotation.coordinate.latitude, annotation.coordinate.longitude),
                                        MKCoordinateSpanMake(0.002, 0.002));
    }

    [mapView setRegion:[mapView regionThatFits:region] animated:NO];
}

- (void)zoomToFitRegionForAnnotations:(NSArray*)annotations inMapView:(MKMapView*)mapView {
    
    MKCoordinateRegion region = [self calculateRegion:annotations];
    [mapView setRegion:[mapView regionThatFits:region] animated:NO];
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
    
    // Add a little extra space on the sides
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.2;
    
    return region;
}

- (NSMutableArray*)getLocations {
    /**
     * Create some JFMapAnnotations and add to the locations array to be displayed on the map
     */
	CLLocationCoordinate2D annotationCenter;
	JFMapAnnotation *annotation;
	
	annotationCenter.latitude = 33.7489;
	annotationCenter.longitude =  -84.3881;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Location: Atlanta, GA"
                                                withSubtitle:@"Meetup Date: 12/20/2012"];
	[_locations addObject:annotation];
	
	annotationCenter.latitude = 34.0753;
	annotationCenter.longitude =  -84.2942;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Location: Alparetta, GA"
                                                withSubtitle:@"Meetup Date: 01/12/2013"];
	[_locations addObject:annotation];
	
	annotationCenter.latitude = 34.0231;
	annotationCenter.longitude =  -84.3617;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Location: Roswell, GA"
                                                withSubtitle:@"Meetup Date: 12/02/2012"];
	[_locations addObject:annotation];
	
	annotationCenter.latitude = 33.8583;
	annotationCenter.longitude =  -84.0064;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Location: Snellville, GA"
                                                withSubtitle:@"Meetup Date: 02/13/2013"];
	[_locations addObject:annotation];
    
    annotationCenter.latitude = 33.9608;
	annotationCenter.longitude =  -83.3781;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Location: Athens, GA"
                                                withSubtitle:@"Meetup Date: 02/15/2013"];
	[_locations addObject:annotation];
    
    return _locations;
}

# pragma mark - LocationManager singleton methods

+ (JFMapManager*)sharedInstance {
    static JFMapManager *instance = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    
    return(instance);
}

@end
