//
//  NSString+FLTExtended.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "NSString+FLTExtended.h"

@implementation NSString (FLTExtended)

- (NSString *) flt_localized {
    return NSLocalizedStringFromTable(self, @"FLTLocalizable", nil);
}

+ (NSArray *) flt_filters {
    return @[@"CIFilterNone",
             @"CIColorInvert",
             @"CIColorMonochrome",
             @"CIColorPosterize",
             @"CIFalseColor",
             @"CIPhotoEffectChrome",
             @"CIPhotoEffectFade",
             @"CIPhotoEffectInstant",
             @"CIPhotoEffectMono",
             @"CIPhotoEffectNoir",
             @"CIPhotoEffectProcess",
             @"CIPhotoEffectTonal",
             @"CIPhotoEffectTransfer",
             @"CISepiaTone",
             @"CIVignette"];
}

@end
