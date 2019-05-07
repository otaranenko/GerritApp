//
//  SLLRootCoordinator.m
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLRootCoordinator.h"
#import "./Modules/SLLProjectRouter.h"
#import "./Modules/SLLAccountRouter.h"
#import "./Modules/SLLChangesRouter.h"

#import "./Service/SLLNetworkService.h"
#import "./Service/SLLInteractorMainService.h"


@interface SLLRootCoordinator ()

@property (nonatomic, readonly) UITabBarController *tabBarController;
@property (nonatomic, readonly) UIViewController *changesViewController;
@property (nonatomic, readonly) UIViewController *projectsViewController;
@property (nonatomic, readonly) UIViewController *accountsViewController;
@property (nonatomic, strong) SLLChangesRouter *changeRouteModule;
@property (nonatomic, strong) SLLAccountRouter *accountRouteModule;
@property (nonatomic, strong) SLLProjectRouter *projectRouteModule;

@property (nonatomic, strong)SLLNetworkService *sll;
@property (nonatomic, strong)SLLInteractorMainService *interactorService;

@end


@implementation SLLRootCoordinator


- (UIViewController *)rootCustomViewController
{
    [self assemblyService];
    return [self tabBarController];
}


#pragma mark - RootViewController Assembly

- (UITabBarController *)tabBarController
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

- (void)assemblyService
{
    self.sll = [SLLNetworkService new];
    self.interactorService = [SLLInteractorMainService new];
    self.sll.interactor = self.interactorService;
    self.interactorService.networkService = self.sll;
}


#pragma mark - Module Changes Assembly

- (UIViewController *)changesViewController
{
    self.changeRouteModule = [SLLChangesRouter new];
    UIViewController *viewController = [[UINavigationController alloc] initWithRootViewController:[self.changeRouteModule assemblyModuleChange:self.interactorService]];
    viewController.tabBarItem.title = @"Изменения";
    viewController.tabBarItem.image = [UIImage imageNamed:@"noun_change"];
    return viewController;
}


#pragma mark - Module Project Assembly

- (UIViewController *)projectsViewController
{
    self.projectRouteModule = [SLLProjectRouter new];
    UIViewController *viewController = [[UINavigationController alloc] initWithRootViewController:[self.projectRouteModule assemblyModuleProject:self.interactorService]];
    viewController.tabBarItem.title = @"Проекты";
    viewController.tabBarItem.image = [UIImage imageNamed:@"noun_project"];
    return viewController;
}


#pragma mark - Module AccountSelf Assembly

- (UIViewController *)accountsViewController
{
    self.accountRouteModule = [SLLAccountRouter new];
    UIViewController *viewController = [[UINavigationController alloc] initWithRootViewController:[self.accountRouteModule assemblyModuleAccount:self.interactorService]];
    viewController.tabBarItem.title = @"Аккаунт";
    viewController.tabBarItem.image = [UIImage imageNamed:@"noun_account"];
    return viewController;
}


@end
