//
//  JFRequest.m
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/15/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//
//  Web Service URL: http://itunes.apple.com/search?term=steven+spielberg&media=movie&entity=movie&attribute=producerTerm&limit=20
//  Web Service Information: http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html
//  Some icons were used from icons availabel here: http://www.iconfinder.com/

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
        
        /**
         * PLEASE NOTE: The web service I'm using returns a JSON response. 
         * The ONLY difference between an XML or JSON response would be to use 
         * NSXMLParser to parse the XML or to use NSJSONSerialization to parse the JSON.
         * 
         * To use the NSXMLParser we would simply create and instance of it, then set it's 
         * delegate to "self", and make sure we set our class as an "NSXMLParserDelegate" 
         * and override the delegate method listed below to retreive elements.
         * 
         * parser:didStartElement:namespaceURI:qualifiedName:attributes:
         *
         * Parameters
         * parser
         * A parser object.
         *
         * elementName
         * A string that is the name of an element (in its start tag).
         *
         * namespaceURI
         * If namespace processing is turned on, contains the URI for the current namespace as a string object.
         *
         * qualifiedName
         * If namespace processing is turned on, contains the qualified name for the current namespace as a string object..
         *
         * attributeDict
         * A dictionary that contains any attributes associated with the element. Keys are the names of attributes, and values are attribute values.
         * 
         */
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
