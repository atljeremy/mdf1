//
//  JFMapManager.h
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface JFMapManager : NSObject

@property (nonatomic, strong) NSMutableArray* locations;

/**
 * Create/Get single instance of JFMapManager class and return it
 */
+ (JFMapManager *)sharedInstance;

/**
 * Helper methods to zoom map to visible annotation(s) area
 */
- (void)zoomToFitRegionForAnnotation:(id<MKAnnotation>)annotation inMapView:(MKMapView*)mapView;
- (void)zoomToFitRegionForAnnotations:(NSArray*)annotations inMapView:(MKMapView*)mapView;
- (MKCoordinateRegion)calculateRegion:(NSArray *)annotations;

@end
