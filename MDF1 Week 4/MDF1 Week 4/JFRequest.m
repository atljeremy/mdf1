//
//  JFRequest.m
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/15/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "JFRequest.h"

@interface JFRequest()
@property (nonatomic, weak) id<JFRequestDelegate> delegate;
@end

@implementation JFRequest
@synthesize delegate = _delegate;

- (JFRequest*)init {
    @throw [NSException exceptionWithName:@"JFRequest Invalid Initialization"
                                   reason:@"JFRequest must only be initialized using initWithDelegate:"
                                 userInfo:nil];
    return nil;
}

- (JFRequest*)initWithDelegate:(id<JFRequestDelegate>)requestDelegate {
    
    NSParameterAssert(requestDelegate);
    
    if (self = [super init]) {
        _delegate = requestDelegate;
    }
    return self;
}

- (void)performRequestForURL:(NSString*)url {
    
    NSParameterAssert(url);
    
    JFResponse* response = [[JFResponse alloc] init];
    
    NSMutableData* data = [NSMutableData dataWithContentsOfURL:[NSURL URLWithString:url]];
    
    if (data) {
        NSError* error;
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if (json) {
            response.totalResults     = [[json objectForKey:kResultCountKey] intValue];
            response.originalResponse = json;
            response.moviesArray      = [json objectForKey:kResultsKey];
        }
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(requestReturnedResponse:)]) {
        [_delegate requestReturnedResponse:response];
    }
}

@end
