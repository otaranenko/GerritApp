//
//  SLLProjectsPresenterProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 17/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#import "SLLProject.h"


@class UIViewController;


@protocol SLLProjectsPresenterOutputProtocol <NSObject>

- (void)setTableViewForCellDataAccount:(NSDictionary<NSString *, SLLProject *> *)data;

@end


@protocol SLLProjectsPresenterInputProtocol <NSObject>

- (void)getDataForProjectsList;
- (void)showBrowserProject:(SLLProject *) data forView:(UIViewController *)view;

@end
