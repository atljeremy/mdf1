//
//  MainViewController.m
//  MDF1 Week 4
//
//  Created by Jeremy Fox on 10/15/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//
//  Web Service URL: http://itunes.apple.com/search?term=steven+spielberg&media=movie&entity=movie&attribute=producerTerm&limit=20
//  Web Service Information: http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html
//  Some icons were used from icons availabel here: http://www.iconfinder.com/

#import "MainViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "MovieCell.h"
#import "ResponseViewController.h"
#import "AppDelegate.h"
#import "DetailViewController.h"

#define kMoviewCellIdentifier @"movieCell"
#define kMovieCellHeight      115

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Spielberg Films", @"Spielberg Films");
        self.tabBarItem.image = [UIImage imageNamed:@"movie_director_icon"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil] forCellReuseIdentifier:kMoviewCellIdentifier];
    
    if (!self.moviesArray || [self.moviesArray count] == 0) {
        [self showLoadingLabel];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)showLoadingLabel {
    self.tableView.alpha    = 0.0;
    self.tableView.hidden   = YES;
    self.loadingView.alpha  = 1.0;
    self.loadingView.hidden = NO;
    [self.activityIndicator startAnimating];
}

- (void)showMovieTableViewAnmiated:(BOOL)animated {
    if (animated) {
        [UIView animateWithDuration:0.5 animations:^{
            self.loadingView.alpha = 0.0;
            self.tableView.hidden   = NO;
            self.tableView.alpha    = 1.0;
        }
        completion:^(BOOL finished){
            self.loadingView.hidden = YES;
            [self.activityIndicator stopAnimating];
        }];
    } else {
        self.tableView.alpha     = 1.0;
        self.tableView.hidden    = NO;
        self.loadingView.alpha  = 0.0;
        self.loadingView.hidden = YES;
    }
}

- (void)updateResponseViewController:(NSString*)responseText {
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [(ResponseViewController*)appDelegate.responseVC setResponseText:responseText];
}

- (void)receivedResponse:(JFResponse*)response {
    self.moviesArray = [NSMutableArray arrayWithArray:response.moviesArray];
    [self.tableView reloadData];
    [self updateResponseViewController:[NSString stringWithFormat:@"%@", response.originalResponse]];
    [self showMovieTableViewAnmiated:YES];
}

#pragma mark - JFRequestDelegate Required Method

- (void)requestReturnedResponse:(JFResponse*)response {
    [self performSelectorOnMainThread:@selector(receivedResponse:) withObject:response waitUntilDone:YES];
}

#pragma mark - UITableViewDataSource Required Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.moviesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary* currentMovie = [self.moviesArray objectAtIndex:indexPath.row];
    
    MovieCell* cell = [tableView dequeueReusableCellWithIdentifier:kMoviewCellIdentifier];

    [cell.imageView setImageWithURL:[currentMovie objectForKey:kArtworkUrl100] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    cell.title.text = [currentMovie objectForKey:kTrackNameKey];
    cell.rating.text = [NSString stringWithFormat:@"Rated %@", [currentMovie objectForKey:kContentAdvisoryRating]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kMovieCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary* currentMovie = [self.moviesArray objectAtIndex:indexPath.row];
    
    DetailViewController* detailVC = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    detailVC.movie = currentMovie;
    
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
