//
//  AlbumViewController.m
//  radio
//
//  Created by Eric Muller on 7/14/13.
//  Copyright (c) 2013 Unexplored Novelty, LLC. All rights reserved.
//

#import "AlbumViewController.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

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
        
        [self.view addSubview:_bgView];
        [self.view addSubview:_albumView];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animate
{
    NSURL *url = [NSURL URLWithString:@"http://ecx.images-amazon.com/images/I/917Z407djoL._SL1500_.jpg"];
    [self.albumView setImageWithURL:url];
}

@end
