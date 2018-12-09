//
//  UIColor+FLTExtended.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "UIColor+FLTExtended.h"

@implementation UIColor (FLTExtended)

+ (instancetype) colorWithHex:(NSUInteger)hex {
    CGFloat red, green, blue, alpha;
    red = ((CGFloat)((hex >> 16) & 0xFF)) / ((CGFloat)0xFF);
    green = ((CGFloat)((hex >> 8) & 0xFF)) / ((CGFloat)0xFF);
    blue = ((CGFloat)((hex >> 0) & 0xFF)) / ((CGFloat)0xFF);
    alpha = hex > 0xFFFFFF ? ((CGFloat)((hex >> 24) & 0xFF)) / ((CGFloat)0xFF) : 1;
    return [UIColor colorWithRed: red green:green blue:blue alpha:alpha];
}

+ (instancetype) flt_accent {
    return [self colorWithHex: 0x446adb];
}

+ (instancetype) flt_white {
    return [self colorWithHex: 0xffffff];
}

- (instancetype) alpha {
    return [self colorWithAlphaComponent: 0.5f];
}

@end
