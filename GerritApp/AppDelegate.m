//
//  AppDelegate.m
//  GerritApp
//
//  Created by Oleg Taranenko on 28/02/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "AppDelegate.h"
#import "SLLRootCoordinator.h"


@interface AppDelegate ()

@property (nonatomic, strong) SLLRootCoordinator *rootViewControllerCoordinator;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];    
    self.window.layer.masksToBounds = YES;
    self.window.layer.cornerRadius = 7;
    
    self.rootViewControllerCoordinator = [SLLRootCoordinator new];
    self.window.rootViewController = [self.rootViewControllerCoordinator rootCustomViewController];

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
