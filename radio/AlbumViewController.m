//
//  AlbumViewController.m
//  radio
//
//  Created by Eric Muller on 7/14/13.
//  Copyright (c) 2013 Unexplored Novelty, LLC. All rights reserved.
//

#import "AlbumViewController.h"
#import "AppDelegate.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AFNetworking/AFImageRequestOperation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <UIImage+StackBlur.h>
#import "PlayerViewController.h"

// a few album art samples
#define prettyLights @"http://ecx.images-amazon.com/images/I/917Z407djoL._SL1500_.jpg"
#define bonIver @"http://ecx.images-amazon.com/images/I/81FBQgaJ-nL._SL1425_.jpg"
#define grizzlyBear @"http://ecx.images-amazon.com/images/I/71cSnMd1aUL._SL1129_.jpg"
#define albumPreview @[prettyLights, bonIver, grizzlyBear]

@interface AlbumViewController ()

@property (nonatomic, strong) UIImageView *albumView;
@property (nonatomic, strong) UIImageView *bgView;
@property (nonatomic, strong) PlayerViewController *playerVC;

@end

@implementation AlbumViewController

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // demo for album art
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(demoAlbumArt)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    
    // album art
    _albumView = [[UIImageView alloc] initWithFrame: CGRectMake(36,
                                                                36,
                                                                248,
                                                                248)];
    
    // blurred album art placeholder
    _bgView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [_bgView setContentMode:UIViewContentModeCenter];
    
    [self.view addSubview:_bgView];
    [self.view addSubview:_albumView];
    
    // player view
    _playerVC = [[PlayerViewController alloc] init];
    [self addChildViewController:_playerVC];
    _playerVC.view.frame = CGRectMake(0,
                                      320,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height - 320);
    [self.view addSubview:_playerVC.view];
    [_playerVC didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)animate
{
    [self demoAlbumArt];
}

- (void)demoAlbumArt
{
    // currently this loads everything from the iTunes library
    NSArray *mediaLibrary = [[[MPMediaQuery alloc] init] items];
    if (mediaLibrary)
    {
        [self loadAlbumArtFromDevice:mediaLibrary];
    }
    else
    {
        [self loadAlbumArtFromNetwork];
    }
}

- (void)loadAlbumArtFromDevice:(NSArray *)mediaLibrary
{
    int r = arc4random() % [mediaLibrary count];
    MPMediaItemArtwork *albumArt = [[mediaLibrary objectAtIndex:r] valueForProperty:MPMediaItemPropertyArtwork];
    if (albumArt)
    {
        self.albumView.image = [albumArt imageWithSize:CGSizeMake(280, 280)];
        self.bgView.image = [[albumArt imageWithSize:CGSizeMake(600, 600)] stackBlur:15];
    }
    else
    {
        [self loadAlbumArtFromNetwork];
    }
}

- (void)loadAlbumArtFromNetwork
{
    int r = arc4random() % [albumPreview count];
    NSURL *url = [NSURL URLWithString:[albumPreview objectAtIndex:r]];
    
    [self.albumView setImageWithURL:url];
    
    __weak AlbumViewController *weakSelf = self;
    AFImageRequestOperation *operation = [AFImageRequestOperation imageRequestOperationWithRequest:[NSURLRequest requestWithURL:url]
                                                                                           success:^(UIImage *image) {
                                                                                               weakSelf.bgView.image = [image stackBlur:15];
                                                                                           }];
    
    [operation start];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
