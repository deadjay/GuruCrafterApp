//
//  AppDelegate.m
//  GuruCrafterApp
//
//  Created by Артем Алексеев on 1/31/16.
//  Copyright (c) 2016 Artyom Alexeev. All rights reserved.
//

#import "ADAppDelegate.h"
#import "ADStartViewController.h"
#import "ADUniversityViewController.h"
#import "ADStudentsTableViewController.h"
#import "ADDataManager.h"

@interface ADAppDelegate ()

@end

@implementation ADAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //ADUniversityViewController* vc = [[ADUniversityViewController alloc] init];
    
    //ADStartViewController* vc = [[ADStartViewController alloc] init];
    //UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:vc];
    
    //ADStartViewController* vc = [[ADStartViewController alloc] init];
    
    //self.window.rootViewController = vc;
        
    //[[ADDataManager sharedManager] addAllObjects];
    
    [self firstTimeRunning];
    
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
    // Saves changes in the application's managed object context before the application terminates.
    [[ADDataManager sharedManager] saveContext];
}

- (void) firstTimeRunning {
    
    if (![@"1" isEqualToString:[[NSUserDefaults standardUserDefaults]
                                objectForKey:@"aValue"]]) {
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"aValue"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[ADDataManager sharedManager] addAllObjects];
        
    }
    
}

@end