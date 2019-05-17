//
//  SLLRootCoordinator.m
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLRootCoordinator.h"
#import "./Modules/SLLProjectsAssembly.h"
#import "./Modules/SLLAccountAssembly.h"
#import "./Modules/SLLChangesAssembly.h"


@interface SLLRootCoordinator ()

@property (nonatomic, readonly) UITabBarController *tabBarController;
@property (nonatomic, readonly) UIViewController *changesViewController;
@property (nonatomic, readonly) UIViewController *projectsViewController;
@property (nonatomic, readonly) UIViewController *accountsViewController;
@property (nonatomic, strong) SLLChangesAssembly *changeModule;
@property (nonatomic, strong) SLLAccountAssembly *accountModule;
@property (nonatomic, strong) SLLProjectsAssembly *projectModule;

@end


@implementation SLLRootCoordinator


#pragma mark - RootViewController Assembly

- (UIViewController *)rootCustomViewController
{
    UITabBarController *tabBarViewController = [[UITabBarController alloc] init];
    tabBarViewController.tabBar.translucent = YES;
    tabBarViewController.tabBar.tintColor = [UIColor whiteColor];
    tabBarViewController.tabBar.barTintColor = [UIColor blackColor];
    tabBarViewController.viewControllers = @[self.changesViewController,
                                             self.projectsViewController,
                                             self.accountsViewController];
    return tabBarViewController;
}


#pragma mark - Module Changes Assembly

- (UIViewController *)changesViewController
{
    self.changeModule = [SLLChangesAssembly new];
    UIViewController *viewController = [[UINavigationController alloc] initWithRootViewController:[self.changeModule assemblyModuleChange]];
    viewController.tabBarItem.title = @"Изменения";
    viewController.tabBarItem.image = [UIImage imageNamed:@"noun_change"];
    return viewController;
}


#pragma mark - Module Project Assembly

- (UIViewController *)projectsViewController
{
    self.projectModule = [SLLProjectsAssembly new];
    UIViewController *viewController = [[UINavigationController alloc] initWithRootViewController:[self.projectModule assemblyModuleProjects]];
    viewController.tabBarItem.title = @"Проекты";
    viewController.tabBarItem.image = [UIImage imageNamed:@"noun_project"];
    return viewController;
}


#pragma mark - Module AccountSelf Assembly

- (UIViewController *)accountsViewController
{
    self.accountModule = [SLLAccountAssembly new];
    UIViewController *viewController = [[UINavigationController alloc] initWithRootViewController:[self.accountModule assemblyModuleAccount]];
    viewController.tabBarItem.title = @"Аккаунт";
    viewController.tabBarItem.image = [UIImage imageNamed:@"noun_account"];
    return viewController;
}


@end
