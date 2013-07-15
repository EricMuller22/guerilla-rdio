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
    _controls = [[UIToolbar alloc] init];
    _controls.frame = CGRectMake(0,
                                 208,
                                 self.view.bounds.size.width,
                                 40);
    _controls.barStyle = UIBarStyleDefault;
    _controls.barTintColor = [UIColor colorFromRGB:0x000000 alpha:0.0f];
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                                   target:nil
                                                                                   action:nil];
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                                target:nil
                                                                                action:nil];
    fixedSpace.width = 40;
    UIBarButtonItem *playButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay
                                                                                target:self
                                                                                action:@selector(didPressPlay)];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRewind
                                                                                target:self
                                                                                action:@selector(didPressBack)];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                                                target:self
                                                                                action:@selector(didPressNext)];
    [_controls setItems:@[flexibleSpace, backButton, fixedSpace, playButton, fixedSpace, nextButton, flexibleSpace]];
    [self.view addSubview:_controls];
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
