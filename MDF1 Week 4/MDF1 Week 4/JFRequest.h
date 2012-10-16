//
//  JFRequest.h
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/15/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JFResponse.h"

#define kResultCountKey @"resultCount"
#define kResultsKey     @"results"

#define kTrackNameKey   @"trackName"
#define kArtworkUrl100  @"artworkUrl100"

@protocol JFRequestDelegate <NSObject>

@required
- (void)requestReturnedResponse:(JFResponse*)response;

@end

@interface JFRequest : NSObject

- (JFRequest*)initWithDelegate:(id<JFRequestDelegate>)requestDelegate;

- (void)performRequestForURL:(NSString*)url;

@end
