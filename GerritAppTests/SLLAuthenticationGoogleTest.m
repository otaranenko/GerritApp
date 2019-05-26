//
//  SLLAuthenticationGoogleTest.m
//  GerritAppTests
//
//  Created by Oleg Taranenko on 25/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "../GerritApp/SLLAuthenticationGoogle.h"

@interface SLLAuthenticationGoogle (Tests)

- (BOOL)reportAuthenticatedStatus;
- (SLLAccount *)refreshUserInfo;
- (void)checkAuthenticationService;

@end


@interface SLLAuthenticationGoogleTest : XCTestCase

@property (nonatomic, strong) SLLAuthenticationGoogle *authService;

@end


@implementation SLLAuthenticationGoogleTest

- (void)setUp
{
    [super setUp];
    id sign = OCMClassMock([GIDSignIn class]);
    OCMStub([sign sharedInstance]).andReturn(sign);
    self.authService = OCMPartialMock([SLLAuthenticationGoogle new]);
}

- (void)tearDown
{
    [super tearDown];
    self.authService = nil;
}


- (void)testReportAuthenticatedStatus_no
{
    id account = nil;
    OCMStub([self.authService refreshUserInfo]).andReturn(account);

    BOOL result = [self.authService reportAuthenticatedStatus];
    
    XCTAssertEqual(result, NO);
}

- (void)testReportAuthenticatedStatus_yes
{
    id account = OCMClassMock([SLLAccount class]);
    OCMStub([self.authService refreshUserInfo]).andReturn(account);
    
    BOOL result = [self.authService reportAuthenticatedStatus];
    
    XCTAssertEqual(result, YES);
}

- (void)testRefreshUserInfo_AccountNil
{
    id sign = OCMClassMock([GIDSignIn class]);
    id authenticationInfo = OCMPartialMock([GIDAuthentication new]);

    OCMStub([sign sharedInstance]);
    OCMStub([sign sharedInstance].currentUser);
    OCMStub([[[sign sharedInstance] currentUser] authentication]).andReturn(authenticationInfo);
    
    SLLAccount *account = [self.authService refreshUserInfo];
    
    XCTAssertEqual(account, nil);
}

- (void)testSignIndidSignInForUserwithError_error
{
    NSError *error = OCMClassMock([NSError class]);
    id sigIn = OCMClassMock([GIDSignIn class]);
    id userInfo = OCMClassMock([GIDGoogleUser class]);
    
    [self.authService signIn:sigIn didSignInForUser:userInfo withError:error];
    
    OCMReject([self.authService reportAuthenticatedStatus]);
    OCMReject([self.authService checkAuthenticationService]);
}

- (void)testSignIndidSignInForUserwithError_NotError
{
    NSError *error = nil;
    id sigIn = OCMClassMock([GIDSignIn class]);
    id userInfo = OCMClassMock([GIDGoogleUser class]);
    OCMStub([self.authService checkAuthenticationService]);
    OCMStub([self.authService reportAuthenticatedStatus]);
    
    [self.authService signIn:sigIn didSignInForUser:userInfo withError:error];
    
    OCMVerify([self.authService reportAuthenticatedStatus]);
    OCMVerify([self.authService checkAuthenticationService]);
}

- (void)testSignIndidDisconnectWithUserwithError_
{
    NSError *error = nil;
    id sigIn = OCMClassMock([GIDSignIn class]);
    id userInfo = OCMClassMock([GIDGoogleUser class]);
    OCMStub([self.authService checkAuthenticationService]);
    OCMStub([self.authService reportAuthenticatedStatus]);
    
    [self.authService signIn:sigIn didDisconnectWithUser:userInfo withError:error];
    
    OCMVerify([self.authService reportAuthenticatedStatus]);
    OCMVerify([self.authService checkAuthenticationService]);
}

- (void)testCheckAuthenticationService_statusAuthentionYes
{
    self.authService.statusAuthention = YES;
    id<SLLAuthenticationServiceOutputProtocol> interacor = OCMProtocolMock(@protocol(SLLAuthenticationServiceOutputProtocol));
    self.authService.interactor = interacor;
    [self.authService checkAuthenticationService];
    
    OCMVerify([self.authService.interactor isAuthenticationService:self.authService.statusAuthention]);
}

- (void)testCheckAuthenticationService_statusAuthentionNO
{
    self.authService.statusAuthention = NO;
    id<SLLAuthenticationServiceOutputProtocol> interacor = OCMProtocolMock(@protocol(SLLAuthenticationServiceOutputProtocol));
    self.authService.interactor = interacor;
    [self.authService checkAuthenticationService];
    
    OCMVerify([self.authService.interactor isAuthenticationService:self.authService.statusAuthention]);
}

- (void)testSigOutAuthenticationService
{
    id sign = OCMClassMock([GIDSignIn class]);
    OCMStub([sign sharedInstance]);
    OCMStub([self.authService reportAuthenticatedStatus]);
    
    [self.authService sigOutAuthenticationService];
    
    OCMVerify([self.authService checkAuthenticationService]);
    
}

@end
