//
//  SettingsViewController.m
//  MDF1 Week 2
//
//  Created by Jeremy Fox on 9/30/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import "SettingsViewController.h"
#import "MotoSpeedConstants.h"
#import "ContactInfoViewController.h"
#import "MyBikesViewController.h"
#import "SocialNetworksViewController.h"
#import "AboutViewController.h"
#import "PrivacyPolicyViewController.h"
#import "TermsViewController.h"

#define kMyInfoSection    0
#define kSocialSection    1
#define kAboutSection     2
#define kNumberOfSections 3

@interface SettingsViewController ()
@property (nonatomic, strong) NSArray* settingsMyInfo;
@property (nonatomic, strong) NSArray* settingsSocial;
@property (nonatomic, strong) NSArray* settingsAbout;
@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Settings", @"Settings");
        self.tabBarItem.image = [UIImage imageNamed:@"gear"];
        self.settingsMyInfo = [NSArray arrayWithObjects:@"Contact Info", @"My Bikes", nil];
        self.settingsSocial = [NSArray arrayWithObjects:@"Twitter", @"Facebook", nil];
        self.settingsAbout = [NSArray arrayWithObjects:@"About MotoSpeed", @"Privacy Policy", @"Terms of Use", nil];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource Required Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int retVal = 0;
    switch (section) {
        case kMyInfoSection:
            retVal = [self.settingsMyInfo count];
            break;
            
        case kSocialSection:
            retVal = [self.settingsSocial count];
            break;
            
        case kAboutSection:
            retVal = [self.settingsAbout count];
            break;
            
        default:
            break;
    }
    
    return retVal;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    switch (indexPath.section) {
        case kMyInfoSection:
            cell.textLabel.text = [self.settingsMyInfo objectAtIndex:indexPath.row];
            break;
            
        case kSocialSection:
            cell.textLabel.text = [self.settingsSocial objectAtIndex:indexPath.row];
            break;
            
        case kAboutSection:
            cell.textLabel.text = [self.settingsAbout objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UITableViewDataSource Optional Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kNumberOfSections;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString* retVal;
    switch (section) {
        case kMyInfoSection:
            retVal = @"My Info";
            break;
            
        case kSocialSection:
            retVal = @"Social Networks";
            break;
            
        case kAboutSection:
            retVal = @"About";
            break;
            
        default:
            break;
    }
    
    return retVal;
}


#pragma mark - UITableViewDelegate Optional Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController* viewController;
    
    switch (indexPath.section) {
        case kMyInfoSection:
            if (0 == indexPath.row) {
                viewController = [[ContactInfoViewController alloc] initWithNibName:kContactInfoVCNib bundle:nil];
            } else if(1 == indexPath.row) {
                viewController = [[MyBikesViewController alloc] initWithNibName:kMyBikesVCNib bundle:nil];
            }
            break;
            
        case kSocialSection:
            if (0 == indexPath.row) {
                viewController = [[SocialNetworksViewController alloc] initWithNibName:kSocialNetworksVCNib bundle:nil];
            } else if(1 == indexPath.row) {
                viewController = [[SocialNetworksViewController alloc] initWithNibName:kSocialNetworksVCNib bundle:nil];
            }
            break;
            
        case kAboutSection:
            if (0 == indexPath.row) {
                viewController = [[AboutViewController alloc] initWithNibName:kAboutVCNib bundle:nil];
            } else if(1 == indexPath.row) {
                viewController = [[PrivacyPolicyViewController alloc] initWithNibName:kPrivacyVCNib bundle:nil];
            } else if(2 == indexPath.row) {
                viewController = [[TermsViewController alloc] initWithNibName:kTermsVCNib bundle:nil];
            }
            break;
            
        default:
            break;
    }
    
    [self presentViewController:viewController animated:YES completion:nil];
}

@end
