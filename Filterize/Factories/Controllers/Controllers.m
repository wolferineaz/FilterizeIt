//
//  Controllers.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "Controllers.h"

#import "StartViewController.h"

@implementation Controllers

#pragma mark - Init

+ (instancetype) factory {
    static Controllers *factory = nil;
    static dispatch_once_t onceSecurePredicate;
    dispatch_once(&onceSecurePredicate,^{
        factory = [self new];
    });
    return factory;
}

#pragma mark - Controllers

- (UIViewController *) start {
    return [StartViewController new];
}

@end
