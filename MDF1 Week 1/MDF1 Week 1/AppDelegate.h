//
//  AppDelegate.h
//  MDF1 Week 1
//
//  Created by Jeremy Fox on 9/24/12.
//  Copyright (c) 2012 Jeremy Fox. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainViewController *mainViewController;
@property (strong, nonatomic) UINavigationController *navController;

@end
