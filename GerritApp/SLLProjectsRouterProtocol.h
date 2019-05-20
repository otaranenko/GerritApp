//
//  SLLProjectsRouterProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 17/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#import "SLLProject.h"
@class UIViewController;


@protocol SLLProjectsRouterProtocol <NSObject>

- (void)presentBrowserForLoadProject:(SLLProject *)projectData forView:(UIViewController *)view;

@end
