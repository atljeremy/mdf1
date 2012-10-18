//
//  DetailViewController.m
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/17/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//
//  Web Service URL: http://itunes.apple.com/search?term=steven+spielberg&media=movie&entity=movie&attribute=producerTerm&limit=20
//  Web Service Information: http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html
//  Some icons were used from icons availabel here: http://www.iconfinder.com/

#import "DetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "JFRequest.h"

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Movie Details";
    
    if (self.movie) {
        [self.thumb setImageWithURL:[self.movie objectForKey:kArtworkUrl100] placeholderImage:[UIImage imageNamed:@"placeholder"]];
        self.movieTitle.text = [self.movie objectForKey:kTrackNameKey];
        self.movieRating.text = [NSString stringWithFormat:@"Rated %@", [self.movie objectForKey:kContentAdvisoryRating]];
        self.textView.text = [NSString stringWithFormat:@"%@", self.movie];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
