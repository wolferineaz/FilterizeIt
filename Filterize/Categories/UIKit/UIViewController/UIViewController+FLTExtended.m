//
//  UIViewController+FLTExtended.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "UIViewController+FLTExtended.h"

@implementation UIViewController (FLTExtended)

- (UINavigationController *) flt_wrapToNavigation {
    UINavigationController *navigation = [UINavigationController new];
    navigation.viewControllers = @[self];
    return navigation;
}

@end
