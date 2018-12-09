//
//  Controllers.h
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StartViewController;

@interface Controllers : NSObject

+ (instancetype) factory;

- (UIViewController *) start;

- (UIViewController *) filters: (UIImage *) image;

@end
