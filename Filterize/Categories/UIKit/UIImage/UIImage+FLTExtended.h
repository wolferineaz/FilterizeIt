//
//  UIImage+FLTExtended.h
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (FLTExtended)

+ (instancetype) flt_imageWithColor :(UIColor*) color size:(CGSize) size;

- (instancetype) flt_filterize: (NSString *) filterName;

+ (instancetype) flt_flamingo;

+ (instancetype) flt_header;

+ (instancetype) flt_ic_share;

- (instancetype) flt_rendered;

- (instancetype) flt_original;

@end
