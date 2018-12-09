//
//  UIImage+FLTExtended.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "UIImage+FLTExtended.h"

@implementation UIImage (FLTExtended)

+ (instancetype) flt_imageWithColor :(UIColor*) color size:(CGSize) size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, false, 0);
    [color setFill];
    UIRectFill(rect);
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *) flt_filterize: (NSString *) filterName {
    NSLog(@"name = %@", filterName);
    CIFilter *filter = [CIFilter filterWithName: filterName];
    [filter setValue: [CIImage imageWithCGImage: self.CGImage] forKey: kCIInputImageKey];
    return [UIImage imageWithCIImage: filter.outputImage];
}

+ (instancetype) flt_flamingo {
    return [UIImage imageNamed: @"flamingo"];
}

+ (instancetype) flt_header {
    return [UIImage imageNamed: @"header"];
}

@end
