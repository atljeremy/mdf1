//
//  SecondViewController.h
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "JFMapManager.h"

@interface LocationsMapViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, weak) IBOutlet MKMapView* mapView;
@property (nonatomic, weak) NSMutableArray*     locations;
@property (nonatomic, weak) JFMapManager*       mapManager;

@end
