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
#import "../Service/SLLNetworkService.h"


@interface SLLChangesAssembly ()

@property (nonatomic, strong) SLLChangesPresenter *presenter;
@property (nonatomic, strong) SLLChangeViewController *viewController;
@property (nonatomic, strong) SLLChangesInteractor *interactor;
@property (nonatomic, strong) SLLChangesRouter *route;
@property (nonatomic, strong) SLLNetworkService *service;
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
    self.service = [SLLNetworkService new];
    
    self.viewController.presenter = self.presenter;
    
    self.presenter.interactor = self.interactor;
    self.presenter.view = self.viewController;
    self.presenter.router = self.route;
    
    self.interactor.networkService = self.service;
    self.interactor.presenter = self.presenter;
    
    self.service.interactor = self.interactor;
    return self.viewController;
}

@end
