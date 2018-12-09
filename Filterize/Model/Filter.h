//
//  Filter.h
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Filter : NSObject

@property (strong, nonatomic) NSString *name;

@property (strong, nonatomic) UIImage *input;

- (void) loadImage: (void(^)(UIImage *image)) block;

- (BOOL) isNormal;

+ (instancetype) withName: (NSString *) name image: (UIImage *) input;

+ (NSArray <Filter *> *) withNames: (NSArray <NSString *> *) names image: (UIImage *) image;

@end
