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

/**
 * JFMapManager
 *
 * This is a singleton class used to handle storing and keeping track 
 * of "locations" and setting the viewable region for annotations
 */
@interface JFMapManager : NSObject

/**
 * The locations object that will keep both the list and map in sync
 */
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
