//
//  JFResponse.h
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/15/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//
//  Web Service URL: http://itunes.apple.com/search?term=steven+spielberg&media=movie&entity=movie&attribute=producerTerm&limit=20
//  Web Service Information: http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html
//  Some icons were used from icons availabel here: http://www.iconfinder.com/

#import <Foundation/Foundation.h>

@interface JFResponse : NSObject

@property (nonatomic, assign) NSInteger     totalResults;
@property (nonatomic, strong) NSDictionary* originalResponse;
@property (nonatomic, strong) NSArray*      moviesArray;

@end
