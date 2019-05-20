//
//  SLLAccountAssembly.m
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountAssembly.h"
#import "SLLAccountViewController.h"
#import "SLLAccountRouter.h"
#import "SLLAccountPresenter.h"
#import "SLLAccountInteractor.h"
#import "SLLNetworkService.h"
#import "SLLCoreDataService.h"


@interface SLLAccountAssembly ()

@property (nonatomic, strong) SLLAccountViewController *viewController;
@property (nonatomic, strong) SLLAccountPresenter *presenter;
@property (nonatomic, strong) SLLAccountInteractor *interactor;
@property (nonatomic, strong) SLLAccountRouter *route;
@property (nonatomic, strong) SLLNetworkService *serviceNetwork;
@property (nonatomic, strong) SLLCoreDataService *serviceCoreData;

@end


@implementation SLLAccountAssembly

- (UIViewController *)assemblyModuleAccount
{
    self.presenter = [SLLAccountPresenter new];
    self.route = [SLLAccountRouter new];
    self.viewController = [SLLAccountViewController new];
    self.interactor = [SLLAccountInteractor new];
    self.serviceNetwork = [SLLNetworkService new];
    self.serviceCoreData = [SLLCoreDataService new];
    
    self.viewController.presenter = self.presenter;
    
    self.presenter.interactor = self.interactor;
    self.presenter.view = self.viewController;
    self.presenter.router = self.route;
    
    self.interactor.coreDataService = self.serviceCoreData;
    self.interactor.networkService = self.serviceNetwork;
    self.interactor.presenter = self.presenter;
    
    self.serviceNetwork.interactor = self.interactor;
    
    self.serviceCoreData.interactor = self.interactor;
    
    return self.viewController;
}

@end
