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


#pragma mark -  SLLProjectsPresenterInputProtocol

- (void)presentDataForChange:(NSArray *)data
{
    
}

@end
