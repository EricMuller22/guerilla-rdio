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

@end
