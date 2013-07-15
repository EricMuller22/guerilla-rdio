//
//  AppDelegate.h
//  radio
//
//  Created by Eric Muller on 7/13/13.
//  Copyright (c) 2013 Unexplored Novelty, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) AlbumViewController *albumVC;
@property (strong, nonatomic) NSArray *library;

- (void)reloadMediaLibrary;

@end
