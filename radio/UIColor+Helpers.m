//
//  UIColor+Helpers.m
//  radio
//
//  Created by Eric Muller on 7/14/13.
//  Copyright (c) 2013 Unexplored Novelty, LLC. All rights reserved.
//

#import "UIColor+Helpers.h"

@implementation UIColor (Helpers)

+ (UIColor *)colorFromRGB:(int)hex alpha:(float)alpha
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0x00FF00) >> 8))/255.0
                            blue:((float)(hex & 0x0000FF))/255.0
                           alpha:alpha];
}


+ (UIColor *)colorFromRGB:(int)hex
{
    return [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                           green:((float)((hex & 0x00FF00) >> 8))/255.0
                            blue:((float)(hex & 0x0000FF))/255.0
                           alpha:1.0f];
}

@end
