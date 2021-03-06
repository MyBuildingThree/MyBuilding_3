//
//  AppDelegate.m
//  mybuilding
//
//  Created by 汪洋 on 15/7/29.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginSqlite.h"
#import "MyBuildingTabBarController.h"
#import "MainViewController.h"
#import "FocusViewController.h"
#import "FellowsViewController.h"
#import "MineViewController.h"
#import "HomeNavigationController.h"

@interface AppDelegate ()
-(void)openSQL;
-(void)initTabbar;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self openSQL];
    [self initTabbar];
    UIApplication* app = [UIApplication sharedApplication];
    UIScreen* screen = [UIScreen mainScreen];
    
    NSLog(@"screen = %lf",screen.nativeScale);
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

/**
 *  打开本地数据库
 */
-(void)openSQL{
    [LoginSqlite opensql];
}

/**
 *  初始化tabbar
 */
-(void)initTabbar{
    MyBuildingTabBarController *tab = [MyBuildingTabBarController sharedTabbarController];
    
    MainViewController *main = [[MainViewController alloc] init];
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:main];
    
    FocusViewController *focus = [[FocusViewController alloc] init];
    UINavigationController *focusNav = [[UINavigationController alloc] initWithRootViewController:focus];
    
    FellowsViewController *fellows = [[FellowsViewController alloc] init];
    UINavigationController *fellowsNav = [[UINavigationController alloc] initWithRootViewController:fellows];
    
    MineViewController *mine = [[MineViewController alloc] init];
    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mine];
    
    tab.viewControllers = @[mainNav,focusNav,fellowsNav,mineNav];
    
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
}
@end
