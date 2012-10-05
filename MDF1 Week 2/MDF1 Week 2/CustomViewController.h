//
//  CustomViewController.h
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 9/30/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface CustomViewController : UIViewController <MKMapViewDelegate>

/**
 * Map view used to display static annotations that are to represent upcoming Meetup events.
 * I wanted to add a right accessory view callout and show additional details 
 * for each event when clicked but ran out of time. :(
 */
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
