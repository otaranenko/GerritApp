//
//  AppDelegate.m
//  GerritApp
//
//  Created by Oleg Taranenko on 28/02/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "AppDelegate.h"
#import "./Modules/SLLProjectViewController.h"
#import "./Modules/SLLAccountViewController.h"
#import "./Modules/SLLChangeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    SLLChangeViewController *changeVC = [[SLLChangeViewController alloc] init];
    changeVC.tabBarItem.title = @"Изменения";
    changeVC.tabBarItem.image = [UIImage imageNamed:@"noun_change"];
    
    SLLProjectViewController *projectVC = [[SLLProjectViewController alloc] init];
    projectVC.tabBarItem.title = @"Проекты";
    projectVC.tabBarItem.image = [UIImage imageNamed:@"noun_project"];
    
    SLLAccountViewController *accountVC = [[SLLAccountViewController alloc] init];
    accountVC.tabBarItem.title = @"Аккаунт";
    accountVC.tabBarItem.image = [UIImage imageNamed:@"noun_account"];
    accountVC.tabBarItem.selectedImage = [UIImage imageNamed:@"zodiak2"];
    
    NSArray *viewControllerArray = @[changeVC, projectVC, accountVC];
    UITabBarController *tabBarViewController = [[UITabBarController alloc] init];
    tabBarViewController.tabBar.translucent = YES;
    tabBarViewController.tabBar.tintColor = [UIColor whiteColor];
    tabBarViewController.tabBar.barTintColor = [UIColor blackColor];
    
    tabBarViewController.viewControllers = viewControllerArray;
    self.window.rootViewController = tabBarViewController;
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
}


- (void)applicationWillTerminate:(UIApplication *)application
{

}


@end
