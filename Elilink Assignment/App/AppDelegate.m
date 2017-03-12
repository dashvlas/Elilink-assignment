//
//  AppDelegate.m
//  Elilink Assignment
//
//  Created by Dasha Korneichuk on 12.03.17.
//  Copyright © 2017 Dasha Korneichuk. All rights reserved.
//

#import "AppDelegate.h"
#import "DataManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setShouldDeleteStoreOnModelMismatch:YES];
    [MagicalRecord setupCoreDataStack];
    [[DataManager sharedManager]setDatabase];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MagicalRecord cleanUp];
}

@end
