//
//  JFMapAnnotation.h
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface JFMapAnnotation : NSObject <MKAnnotation>

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord
              withTitle:(NSString *)tl
           withSubtitle:(NSString *)stl;

@end
