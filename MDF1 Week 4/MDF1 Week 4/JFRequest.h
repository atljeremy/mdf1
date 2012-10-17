//
//  JFRequest.h
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/15/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//
//  Web Service URL: http://itunes.apple.com/search?term=steven+spielberg&media=movie&entity=movie&attribute=producerTerm&limit=20
//  Web Service Information: http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html

#import <Foundation/Foundation.h>
#import "JFResponse.h"

#define kResultCountKey @"resultCount"
#define kResultsKey     @"results"

#define kTrackNameKey   @"trackName"
#define kArtworkUrl100  @"artworkUrl100"
#define kContentAdvisoryRating @"contentAdvisoryRating"

@protocol JFRequestDelegate <NSObject>

@required
- (void)requestReturnedResponse:(JFResponse*)response;

@end

@interface JFRequest : NSObject

- (JFRequest*)initWithDelegate:(id<JFRequestDelegate>)requestDelegate;

- (void)performRequestForURL:(NSString*)url;

@end
