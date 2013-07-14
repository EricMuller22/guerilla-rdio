//
//  AlbumViewController.m
//  radio
//
//  Created by Eric Muller on 7/14/13.
//  Copyright (c) 2013 Unexplored Novelty, LLC. All rights reserved.
//

#import "AlbumViewController.h"

@interface AlbumViewController ()

@property (nonatomic, strong) UIImageView *albumView;

@end

@implementation AlbumViewController

- (id)init
{
    self = [super init];
    if (self) {
        _albumView = [[UIImageView alloc] initWithFrame:CGRectMake(60,120,200,200)];
        [self.view addSubview:_albumView];
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animate
{
    // self.albumView.image = TODO
}

@end
