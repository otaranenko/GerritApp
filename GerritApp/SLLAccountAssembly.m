//
//  SLLAccountAssembly.m
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountAssembly.h"
#import "SLLAccountViewController.h"
#import "SLLAccountAuthenticationView.h"
#import "SLLAccountRouter.h"
#import "SLLAccountPresenter.h"
#import "SLLAccountInteractor.h"
#import "SLLNetworkService.h"
#import "SLLAuthenticationGoogle.h"


@interface SLLAccountAssembly ()

@property (nonatomic, strong) SLLAccountViewController *viewController;
@property (nonatomic, strong) SLLAccountAuthenticationView *viewControllerAuth;
@property (nonatomic, strong) SLLAccountPresenter *presenter;
@property (nonatomic, strong) SLLAccountInteractor *interactor;
@property (nonatomic, strong) SLLAccountRouter *route;
@property (nonatomic, strong) SLLNetworkService *serviceNetwork;
@property (nonatomic, strong) SLLAuthenticationGoogle *serviceAuthGoogle;

@end


@implementation SLLAccountAssembly

/**
 Собираем модуль
 
 @return Возращает указатель на \"корневой\" ViewController этого модуля
 */
- (UIViewController *)assemblyModuleAccount
{
    self.presenter = [SLLAccountPresenter new];
    self.route = [SLLAccountRouter new];
    self.viewController = [SLLAccountViewController new];
    self.viewControllerAuth = [SLLAccountAuthenticationView new];
    self.interactor = [SLLAccountInteractor new];
    self.serviceNetwork = [SLLNetworkService new];
    self.serviceAuthGoogle = [SLLAuthenticationGoogle new];
    
    self.viewController.presenter = self.presenter;
    self.viewControllerAuth.presenter = self.presenter;
    
    self.route.viewAuthentication = self.viewControllerAuth;
    self.route.view = self.viewController;
    
    self.presenter.interactor = self.interactor;
    self.presenter.view = self.viewController;
    self.presenter.router = self.route;
    
    self.interactor.authenticationService = self.serviceAuthGoogle;
    self.interactor.networkService = self.serviceNetwork;
    self.interactor.presenter = self.presenter;
    
    self.serviceNetwork.interactor = self.interactor;
    self.serviceAuthGoogle.interactor = self.interactor;
    
    return self.viewController;
}

@end
