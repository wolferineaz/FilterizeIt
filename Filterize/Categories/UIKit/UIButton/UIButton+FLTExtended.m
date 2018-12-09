//
//  UIButton+FLTExtended.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "UIButton+FLTExtended.h"

@implementation UIButton (FLTExtended)

- (void) flt_configure {
    [self setTitleColor: [UIColor flt_white] forState: UIControlStateNormal];
    [self setTitleColor: [UIColor flt_white].alpha forState: UIControlStateDisabled];
    UIImage *bgOn = [UIImage flt_imageWithColor: [UIColor flt_accent]
                                           size: self.frame.size];
    UIImage *bgOff = [UIImage flt_imageWithColor: [UIColor flt_accent].alpha
                                            size: self.frame.size];
    [self setBackgroundImage: bgOn forState: UIControlStateNormal];
    [self setBackgroundImage: bgOff forState: UIControlStateDisabled];
    self.layer.cornerRadius = 8.f;
    self.clipsToBounds = YES;
}

@end
