//
//  AppDelegate.m
//  LAtourist
//
//  Created by Avni Barman on 4/3/17.
//  abarman@usc.edu
//  Copyright © 2017 Avni Barman. All rights reserved.
//

#import "AppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
@import GoogleMaps;

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GMSServices provideAPIKey:@"AIzaSyA8r_mov5Z7nbQK1Ljis56Zs5N4Y4vusLw"];

    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    // Add any custom logic here.
    // Check user login
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    /*if([[NSUserDefaults standardUserDefaults] valueForKey:@"AlreadyLogin"])
    {
        // So, here user already login then set your root view controller, let's say `SecondViewController``
        CollectionViewController *secondViewController = [storyboard instantiateViewControllerWithIdentifier:@"firstScreen"];
        // then set your root view controller
        self.window.rootViewController = secondViewController;
    }
    else
    {
        // It means you need to your root view controller is your login view controller, so let's create it
        FacebookViewController  *loginViewController= [storyboard instantiateViewControllerWithIdentifier:@"mainpage"];
        self.window.rootViewController = loginViewController;
    }*/
    FacebookViewController  *loginViewController= [storyboard instantiateViewControllerWithIdentifier:@"mainpage"];
    self.window.rootViewController = loginViewController;

    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                  openURL:url
                                                        sourceApplication:sourceApplication
                                                               annotation:annotation
                    ];
    // Add any custom logic here.
    return handled;
    
} 

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
