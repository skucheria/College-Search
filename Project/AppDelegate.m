//
//  AppDelegate.m
//  Project
//
//  Created by Siddharth Kucheria on 7/9/15.
//  Copyright (c) 2015 Siddharth Kucheria. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>


@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Parse enableLocalDatastore];
    [Parse setApplicationId:@"ollbdYGBKk2ewLCKFdEnMIUR2JkMISkYUiMVatpA"
                  clientKey:@"H8JOjbYIT4mgdyZHSiePGLsHvRFOXsdTTpshV0yU"];
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:98.0f/255.0f green:26.0f/255.0f blue:33.0f/255.0f alpha:1.0]];
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:227.0f/255.0f green:223.0f/255.0f blue:214.0f/255.0f alpha:1.0]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:98.0f/255.0f green:26.0f/255.0f blue:33.0f/255.0f alpha:1.0]];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:253.0f/255.0f green:248.0f/255.0f blue:205.0f/255.0f alpha:1.0]];

//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
