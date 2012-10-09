//
//  DetailViewController.h
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFMapAnnotation.h"
#import "JFMapManager.h"

@interface DetailViewController : UIViewController

@property (nonatomic, weak) JFMapAnnotation*    location;
@property (nonatomic, weak) JFMapManager*       mapManager;
@property (nonatomic, weak) IBOutlet UILabel*   locationTitle;
@property (nonatomic, weak) IBOutlet UILabel*   locationSubTitle;
@property (nonatomic, weak) IBOutlet MKMapView* mapView;

@end
