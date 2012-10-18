//
//  DetailViewController.m
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/17/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

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
