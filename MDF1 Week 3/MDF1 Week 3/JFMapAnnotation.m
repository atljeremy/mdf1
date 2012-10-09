//
//  JFMapAnnotation.m
//  MDF1 Week 3
//
//  Created by Jeremy Fox on 10/8/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFMapAnnotation.h"

@implementation JFMapAnnotation
@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
@synthesize phone;

-(id)initWithCoordinate:(CLLocationCoordinate2D)coord
              withTitle:(NSString *)tl
           withSubtitle:(NSString *)stl
              withPhone:(NSString *)phn{
    
    if(self = [super init])
	{
		coordinate = coord;
		title      = tl;
		subtitle   = stl;
        phone      = phn;
	}
	return self;
}

@end
