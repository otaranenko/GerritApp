//
//  SLLAuthenticationServiceProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 22/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#import "SLLAccount.h"


/**
 Контракт взаимодействия со внешним слоем (Interactor)
 Воздействие из Interactora
 */
@protocol SLLAuthenticationServiceInputProtocol <NSObject>

- (void)checkAuthenticationService;
- (void)sigOutAuthenticationService;

@end


/**
 Контракт взаимодействия со внешним слоем (Interactor)
 Результат (Notification) в Interactor
 */
@protocol SLLAuthenticationServiceOutputProtocol <NSObject>

- (void)dataAuthenticationForUser:(SLLAccount *)accountSelf;
- (void)isAuthenticationService:(BOOL)isAuth;

@end
