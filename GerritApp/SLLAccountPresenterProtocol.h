//
//  SLLAccountPresenterProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#import "SLLAccount.h"


@protocol SLLAccountPresenterOutputProtocol  <NSObject>

- (void)setDataAccount:(SLLAccount *)data;
- (void)setStatusAuthenticationStatus:(BOOL)status;

@end


@protocol SLLAccountPresenterInputProtocol <NSObject>

- (void)getDataForProjectsList;
- (void)stateAuthentication;
- (void)dismissView;
- (void)presentView;
- (void)sigOutAccount;

@end
