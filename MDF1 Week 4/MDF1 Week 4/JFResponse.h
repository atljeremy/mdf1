//
//  JFResponse.h
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/15/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFResponse : NSObject

@property (nonatomic, assign) NSInteger     totalResults;
@property (nonatomic, strong) NSDictionary* originalResponse;
@property (nonatomic, strong) NSArray*      moviesArray;

@end
