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

- (UIImage *) flt_scaleProportionalToMaxSide: (CGFloat) side {
    CGFloat scale = MIN(side / self.size.width , side / self.size.height);
    
    CGSize size = CGSizeMake(self.size.width * scale, self.size.height * scale);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *) flt_filterize: (NSString *) filterName {
    CIContext *imageContext = [CIContext contextWithOptions: nil];
    CIFilter *filter = [CIFilter filterWithName: filterName];
    [filter setValue: [CIImage imageWithCGImage: self.CGImage] forKey: kCIInputImageKey];
    CIImage *ciImage = filter.outputImage;
    CGImageRef cgImageRef = [imageContext createCGImage: ciImage fromRect: [ciImage extent]];
    return [UIImage imageWithCGImage: cgImageRef];
}

- (instancetype) flt_rendered {
    return [self imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
}

- (instancetype) flt_original {
    return [self imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal];
}

+ (instancetype) flt_flamingo {
    return [UIImage imageNamed: @"flamingo"];
}

+ (instancetype) flt_header {
    return [UIImage imageNamed: @"header"];
}

+ (instancetype) flt_ic_share {
    return [UIImage imageNamed: @"ic_share"];
}

+ (instancetype) flt_ic_back {
    return [UIImage imageNamed: @"ic_back"];
}

@end
