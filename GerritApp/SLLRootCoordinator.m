//
//  SLLRootCoordinator.m
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLRootCoordinator.h"
#import "./Modules/SLLAccountViewController.h"
#import "./Modules/SLLProjectViewController.h"
#import "./Modules/SLLChangeViewController.h"

#import "./Service/SLLNetworkService.h"
#import "./Service/SLLInteractorMainService.h"


@interface SLLRootCoordinator ()

@property (nonatomic, readonly) UITabBarController *tabBarController;
@property (nonatomic, readonly) UIViewController *changesViewController;
@property (nonatomic, readonly) UIViewController *projectsViewController;
@property (nonatomic, readonly) UIViewController *accountsViewController;

@property (nonatomic, strong)SLLNetworkService *sll;
@property (nonatomic, strong)SLLInteractorMainService *interactorService;

@end


@implementation SLLRootCoordinator


- (UITabBarController *)rootCustomViewController
{
 //   [self assemblyService];
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
    //Assembly
    self.sll = [SLLNetworkService new];
    self.interactorService = [SLLInteractorMainService new];
    self.sll.interactor = self.interactorService;
    self.interactorService.networkService = self.sll;
    [self.interactorService getChangeGerritForPresenter];
}


#pragma mark - Module Changes Assembly

- (UIViewController *)changesViewController
{
    SLLChangeViewController *changeVC = [[SLLChangeViewController alloc] init];
    changeVC.tabBarItem.title = @"Изменения";
    changeVC.tabBarItem.image = [UIImage imageNamed:@"noun_change"];
    return changeVC;
}


#pragma mark - Module Project Assembly

- (UIViewController *)projectsViewController
{
    SLLProjectViewController *projectVC = [[SLLProjectViewController alloc] init];
    projectVC.tabBarItem.title = @"Проекты";
    projectVC.tabBarItem.image = [UIImage imageNamed:@"noun_project"];
    return projectVC;
}


#pragma mark - Module AccountSelf Assembly

- (UIViewController *)accountsViewController
{
    SLLAccountViewController *accountVC = [[SLLAccountViewController alloc] init];
    accountVC.tabBarItem.title = @"Аккаунт";
    accountVC.tabBarItem.image = [UIImage imageNamed:@"noun_account"];
    return accountVC;
}


@end
