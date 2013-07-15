//
//  PlayerViewController.m
//  radio
//
//  Created by Eric Muller on 7/14/13.
//  Copyright (c) 2013 Unexplored Novelty, LLC. All rights reserved.
//

#import "PlayerViewController.h"
#import "UIColor+Helpers.h"

@interface PlayerViewController ()

@property (strong, nonatomic) UIToolbar *controls;
@property (strong, nonatomic) UIProgressView *progress;
@property (strong, nonatomic) UIBarButtonItem *play;
@property (strong, nonatomic) UIBarButtonItem *back;
@property (strong, nonatomic) UIBarButtonItem *next;

@end

@implementation PlayerViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor colorFromRGB:0x333333 alpha:0.7f];
    }
    return self;
}

- (void)viewDidLoad
{
    // playback controls
    _controls = [[UIToolbar alloc] init];
    _controls.frame = CGRectMake(0,
                                 208,
                                 self.view.bounds.size.width,
                                 40);
    _controls.barStyle = UIBarStyleBlack;
    _controls.barTintColor = [UIColor colorFromRGB:0x333333 alpha:1.0f];
    _controls.translucent = NO;
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:nil
                                                                                   action:nil];
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                target:nil
                                                                                action:nil];
    fixedSpace.width = 40;
    _play = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
                                                                                target:self
                                                                                action:@selector(didPressPlay)];
    _back = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind
                                                                                target:self
                                                                                action:@selector(didPressBack)];
    _next = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                                                target:self
                                                                                action:@selector(didPressNext)];
    [_controls setItems:@[flexibleSpace, _back, fixedSpace, _play, fixedSpace, _next, flexibleSpace]];
    [self.view addSubview:_controls];
    
    // playback progress
    _progress = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    _progress.frame = CGRectMake(0, 206, 320, 2);
    _progress.progressTintColor = [UIColor whiteColor];
    _progress.trackTintColor = [UIColor clearColor];
    _progress.progress = 0.4f;
    [self.view addSubview:_progress];
}

- (void)didPressPlay
{
    NSLog(@"Press play");
}

- (void)didPressBack
{
    NSLog(@"Back");
}

- (void)didPressNext
{
    NSLog(@"Next");
}

@end
