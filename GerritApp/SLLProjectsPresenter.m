//
//  SLLProjectsPresenter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 17/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProjectsPresenter.h"

@implementation SLLProjectsPresenter


#pragma mark -  SLLProjectsPresenterInputProtocol

- (void)getDataForProjectsList
{
    [self.interactor dataForProjects];
}

- (void)showBrowserProject:(SLLProject *) data forView:(UIViewController *)view;
{
    [self.router presentBrowserForLoadProject:data forView:view];
}


#pragma mark -  SLLProjectsPresenterInputProtocol

- (void)presentDataForDictionaryProject:(NSDictionary<NSString *,SLLProject *> *)data { 
      [self.view setTableViewForCellDataAccount:data];
}

@end
