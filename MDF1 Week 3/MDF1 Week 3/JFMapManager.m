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
        _locations = [self createLocations];
    }
    return self;
}

- (void)zoomToFitRegionForAnnotation:(id<MKAnnotation>)annotation inMapView:(MKMapView*)mapView {
    
    MKCoordinateRegion region;
    if (annotation) {
        region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(annotation.coordinate.latitude, annotation.coordinate.longitude),
                                        MKCoordinateSpanMake(0.005, 0.005));
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

- (NSMutableArray*)createLocations {
    /**
     * Create some JFMapAnnotations and add to the locations array to be displayed on the map
     */
    _locations = [NSMutableArray array];
	CLLocationCoordinate2D annotationCenter;
	JFMapAnnotation *annotation;
	
	annotationCenter.latitude = 33.7489;
	annotationCenter.longitude =  -84.3881;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Fox Photography"
                                                withSubtitle:@"Location: Atlanta, GA"
                                                   withPhone:@"(123) 123-1234"];
	[_locations addObject:annotation];
	
	annotationCenter.latitude = 34.0753;
	annotationCenter.longitude =  -84.2942;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Fox Photography"
                                                withSubtitle:@"Location: Alpharetta, GA"
                                                   withPhone:@"(321) 321-0321"];
	[_locations addObject:annotation];
	
	annotationCenter.latitude = 34.0231;
	annotationCenter.longitude =  -84.3617;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Fox Photography"
                                                withSubtitle:@"Location: Roswell, GA"
                                                   withPhone:@"(012) 345-6789"];
	[_locations addObject:annotation];
	
	annotationCenter.latitude = 33.8583;
	annotationCenter.longitude =  -84.0064;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Fox Photography"
                                                withSubtitle:@"Location: Snellville, GA"
                                                   withPhone:@"(333) 333-2222"];
	[_locations addObject:annotation];
    
    annotationCenter.latitude = 33.9608;
	annotationCenter.longitude =  -83.3781;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Fox Photography"
                                                withSubtitle:@"Location: Athens, GA"
                                                   withPhone:@"(121) 121-1212"];
	[_locations addObject:annotation];
    
    annotationCenter.latitude = 34.0289;
	annotationCenter.longitude =  -84.1986;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Fox Photography"
                                                withSubtitle:@"Location: Johns Creek, GA"
                                                   withPhone:@"(323) 323-3232"];
	[_locations addObject:annotation];
	
	annotationCenter.latitude = 34.2072;
	annotationCenter.longitude =  -84.1403;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Fox Photography"
                                                withSubtitle:@"Location: Cumming, GA"
                                                   withPhone:@"(111) 222-3333"];
	[_locations addObject:annotation];
	
	annotationCenter.latitude = 34.0031;
	annotationCenter.longitude =  -84.1456;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Fox Photography"
                                                withSubtitle:@"Location: Duluth, GA"
                                                   withPhone:@"(221) 221-2212"];
	[_locations addObject:annotation];
	
	annotationCenter.latitude = 34.1169;
	annotationCenter.longitude =  -83.9986;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Fox Photography"
                                                withSubtitle:@"Location: Buford, GA"
                                                   withPhone:@"(555) 555-1234"];
	[_locations addObject:annotation];
    
    annotationCenter.latitude = 33.9411;
	annotationCenter.longitude =  -84.2136;
	annotation = [[JFMapAnnotation alloc] initWithCoordinate:annotationCenter
                                                   withTitle:@"Fox Photography"
                                                withSubtitle:@"Location: Norcross, GA"
                                                   withPhone:@"(444) 555-4444"];
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
