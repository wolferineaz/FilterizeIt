//
//  AppDelegate.m
//  Filterize
//
//  Created by Tabriz Dzhavadov on 09/12/2018.
//  Copyright © 2018 Tabriz Dzhavadov. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configureAppearance];
    
    UIViewController *startViewController = [Controllers.factory start];
    self.window = [UIWindow new];
    self.window.rootViewController = [startViewController flt_wrapToNavigation];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void) configureAppearance {
    UIImage *back = [UIImage flt_ic_back].flt_original;
    [[UINavigationBar appearance] setBackIndicatorImage: back];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage: back];
}

@end
