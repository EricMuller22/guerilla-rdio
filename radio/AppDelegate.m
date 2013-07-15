//
//  AppDelegate.m
//  radio
//
//  Created by Eric Muller on 7/13/13.
//  Copyright (c) 2013 Unexplored Novelty, LLC. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "AppDelegate.h"
#import "UIColor+Helpers.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self reloadMediaLibrary];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.albumVC = [[AlbumViewController alloc] init];
    // children of this vc will inherit its tint color
    self.albumVC.view.tintColor = [UIColor whiteColor];
    self.albumVC.view.backgroundColor = [UIColor whiteColor];
    [self.window setRootViewController:self.albumVC];
    [self.window addSubview:self.albumVC.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)reloadMediaLibrary
{
    // currently this loads everything from the iTunes library
    MPMediaQuery *everything = [[MPMediaQuery alloc] init];
    self.library = [everything items];
}

@end
