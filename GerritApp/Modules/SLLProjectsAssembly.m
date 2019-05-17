//
//  SLLProjectsAssembly.m
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//


#import "SLLProjectsAssembly.h"
#import "SLLProjectsRouter.h"
#import "SLLProjectsPresenter.h"
#import "SLLProjectsViewController.h"
#import "SLLProjectsInteractor.h"
#import "../Service/SLLNetworkService.h"
#import "../Service/SLLCoreDataService.h"


@interface SLLProjectsAssembly ()

@property (nonatomic, strong) SLLProjectsPresenter *presenter;
@property (nonatomic, strong) SLLProjectsViewController *viewController;
@property (nonatomic, strong) SLLProjectsInteractor *interactor;
@property (nonatomic, strong) SLLProjectsRouter *route;
@property (nonatomic, strong) SLLNetworkService *serviceNetwork;
@property (nonatomic, strong) SLLCoreDataService *serviceCoreData;

@end


@implementation SLLProjectsAssembly

/**
 Собираем модуль
 
 @return Возращает указатель на \"корневой\" ViewController этого модуля
 */
- (UIViewController *)assemblyModuleProjects
{
    self.presenter = [SLLProjectsPresenter new];
    self.route = [SLLProjectsRouter new];
    self.viewController = [SLLProjectsViewController new];
    self.interactor = [SLLProjectsInteractor new];
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

