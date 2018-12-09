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
    
    UIViewController *startViewController = [Controllers.factory start];
    self.window = [UIWindow new];
    self.window.rootViewController = [startViewController flt_wrapToNavigation];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
