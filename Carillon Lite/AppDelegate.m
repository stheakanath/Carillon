//
//  AppDelegate.m
//  Carillon Lite
//
//  Created by Sony Theakanath on 10/22/13.
//  Copyright (c) 2013 Sony Theakanath. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MMDrawerController.h"
#import "MMExampleLeftSideDrawerViewController.h"
#import "MMDrawerVisualState.h"
#import "MMExampleDrawerVisualStateManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIViewController *centerViewController;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        centerViewController = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    else
        centerViewController = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    MMExampleLeftSideDrawerViewController *leftside = [[MMExampleLeftSideDrawerViewController alloc] init];
    leftside.delegate = centerViewController;
    UIViewController *leftSideDrawerViewController = leftside;
    
    //Setting up Multiview
    UINavigationController * navigationController = [[UINavigationController alloc] initWithRootViewController:centerViewController];
    MMDrawerController * drawerController = [[MMDrawerController alloc] initWithCenterViewController:navigationController leftDrawerViewController:leftSideDrawerViewController rightDrawerViewController:nil];
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    [drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
        MMDrawerControllerDrawerVisualStateBlock block;
        block = [[MMExampleDrawerVisualStateManager sharedManager] drawerVisualStateBlockForDrawerSide:drawerSide];
        if(block)
            block(drawerController, drawerSide, percentVisible);
    }];
    [drawerController setDrawerVisualStateBlock:[MMDrawerVisualState swingingDoorVisualStateBlock]];
    
    //Rest Set Up
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:drawerController];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
