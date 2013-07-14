//
//  AppDelegate.m
//  radio
//
//  Created by Eric Muller on 7/13/13.
//  Copyright (c) 2013 Unexplored Novelty, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+Helpers.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.albumVC = [[AlbumViewController alloc] init];
    // children of this vc will inherit its tint color
    self.albumVC.view.tintColor = [UIColor colorFromRGB:0x4080cf];
    self.albumVC.view.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:self.albumVC];
    [self.window addSubview:self.albumVC.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

@end
