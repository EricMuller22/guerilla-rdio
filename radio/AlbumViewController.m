//
//  AlbumViewController.m
//  radio
//
//  Created by Eric Muller on 7/14/13.
//  Copyright (c) 2013 Unexplored Novelty, LLC. All rights reserved.
//

#import "AlbumViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>
#import <AFNetworking/AFImageRequestOperation.h>
#import <UIImage+StackBlur.h>
#import <UIImage+Resize.h>

#define url [NSURL URLWithString:@"http://ecx.images-amazon.com/images/I/917Z407djoL._SL1500_.jpg"]

@interface AlbumViewController ()

@property (nonatomic, strong) UIImageView *albumView;
@property (nonatomic, strong) UIImageView *bgView;

@end

@implementation AlbumViewController

- (id)init
{
    self = [super init];
    if (self) {
        // album art
        _albumView = [[UIImageView alloc] initWithFrame:CGRectMake(60,120,200,200)];
        
        // blurred album art placeholder
        _bgView = [[UIImageView alloc] initWithFrame:self.view.frame];
        [_bgView setContentMode:UIViewContentModeCenter];
        
        [self.view addSubview:_bgView];
        [self.view addSubview:_albumView];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animate
{
    [self.albumView setImageWithURL:url];
    
    __weak AlbumViewController *weakSelf = self;
    AFImageRequestOperation *operation = [AFImageRequestOperation imageRequestOperationWithRequest:[NSURLRequest requestWithURL:url]
                                                                                           success:^(UIImage *image) {
                                                                                               weakSelf.bgView.image = [image stackBlur:7];
                                                                                           }];

    [operation start];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
