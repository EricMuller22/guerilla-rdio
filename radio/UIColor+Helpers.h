//
//  UIColor+Helpers.h
//  radio
//
//  Created by Eric Muller on 7/14/13.
//  Copyright (c) 2013 Unexplored Novelty, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Helpers)

+ (UIColor *)colorFromRGB:(int)hex;
+ (UIColor *)colorFromRGB:(int)hex alpha:(float)alpha;

@end
