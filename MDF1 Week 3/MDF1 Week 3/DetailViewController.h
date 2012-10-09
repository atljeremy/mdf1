//
//  DetailViewController.h
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "JFMapAnnotation.h"
#import "JFMapManager.h"

/**
 * DetailViewController
 *
 * This is the class used to display additional details for each location
 */
@interface DetailViewController : UIViewController <MKMapViewDelegate>

@property (nonatomic, weak) JFMapAnnotation*    location;
@property (nonatomic, weak) JFMapManager*       mapManager;
@property (nonatomic, weak) IBOutlet UILabel*   locationTitle;
@property (nonatomic, weak) IBOutlet UILabel*   locationSubTitle;
@property (weak, nonatomic) IBOutlet UILabel*   locationPhone;
@property (weak, nonatomic) IBOutlet UILabel*   locationCoords;
@property (nonatomic, weak) IBOutlet MKMapView* mapView;

@end
