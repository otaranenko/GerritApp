    //
//  SLLChangesRouter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 07/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesRouter.h"
#import "SLLChangePresenter.h"
#import "SLLChangeViewController.h"


@interface SLLChangesRouter ()

@property (nonatomic, strong) SLLChangePresenter *presenter;
@property (nonatomic, strong) SLLChangeViewController *viewController;

@end


@implementation SLLChangesRouter

- (UIViewController *)assemblyModuleChange:(id<SLLItercatorInputProtocol>)interactor
{
    self.presenter = [SLLChangePresenter new];
    self.viewController = [SLLChangeViewController new];
    
    self.viewController.presenter = self.presenter;
    self.presenter.interactor = interactor;
    self.presenter.view = self.viewController;
    return self.viewController;
}

@end
