//
//  SLLChangesAssembly.m
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesAssembly.h"
#import "SLLChangesRouter.h"
#import "SLLChangesPresenter.h"
#import "SLLChangeViewController.h"
#import "SLLChangesInteractor.h"
#import "SLLNetworkService.h"
#import "SLLCoreDataService.h"


@interface SLLChangesAssembly ()

@property (nonatomic, strong) SLLChangesPresenter *presenter;
@property (nonatomic, strong) SLLChangeViewController *viewController;
@property (nonatomic, strong) SLLChangesInteractor *interactor;
@property (nonatomic, strong) SLLChangesRouter *route;
@property (nonatomic, strong) SLLNetworkService *serviceNetwork;
@property (nonatomic, strong) SLLCoreDataService *serviceCoreData;
@end


@implementation SLLChangesAssembly


/**
 Собираем модуль

 @return Возращает указатель на \"корневой\" ViewController этого модуля
 */
- (UIViewController *)assemblyModuleChange
{
    self.presenter = [SLLChangesPresenter new];
    self.route = [SLLChangesRouter new];
    self.viewController = [SLLChangeViewController new];
    self.interactor = [SLLChangesInteractor new];
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
