//
//  UIView+FLTExtended.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "UIView+FLTExtended.h"

@implementation UIView (FLTExtended)

+ (UINib *) flt_nib {
    return [UINib nibWithNibName: self.flt_identifier
                          bundle: [NSBundle bundleForClass: [self class]]];
}

+ (NSString *) flt_identifier {
    return NSStringFromClass([self class]);
}

@end
