//
//  SLLAccountPresenter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountPresenter.h"

@implementation SLLAccountPresenter


#pragma mark - SLLAccountPresenterInputProtocol

- (void)getDataForProjectsList
{
    [self.interactor dataForProjects];
}

- (void)stateAuthentication
{
    [self.interactor checkAuth];
}

- (void)dismissView
{
    [self.router dismissViewControllerAuthentication];
}

- (void)presentView
{
     [self.router presentViewControllerAuthentication];
}

- (void)sigOutAccount
{
    [self.interactor sigOutAccount];
}


#pragma mark -  SLLAccountIntercatorOutputProtocol

- (void)presentStatusAuthentication:(BOOL)status
{
    [self.view setStatusAuthenticationStatus:status];
}

- (void)presentDataSelfAccount:(SLLAccount *)data {
    [self.view setDataAccount:data];
}




@end
