//
//  MotoSpeedAnnotation.h
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 10/3/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MotoSpeedAnnotation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
}

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord
              withTitle:(NSString *)tl
           withSubtitle:(NSString *)stl;

@end
