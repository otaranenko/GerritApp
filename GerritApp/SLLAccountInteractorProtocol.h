//
//  SLLAccountInteractorProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#import "SLLAccount.h"


@protocol SLLAccountIntercatorInputProtocol <NSObject>

- (void)dataForProjects;
- (void)checkAuth;
- (void)sigOutAccount;

@end


@protocol SLLAccountIntercatorOutputProtocol <NSObject>

- (void)presentDataSelfAccount:(SLLAccount *)data;
- (void)presentStatusAuthentication:(BOOL)status;

@end
