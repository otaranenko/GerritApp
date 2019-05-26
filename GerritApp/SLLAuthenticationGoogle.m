//
//  SLLAuthenticationGoogle.m
//  GerritApp
//
//  Created by Oleg Taranenko on 22/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAuthenticationGoogle.h"


@implementation SLLAuthenticationGoogle

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        GIDSignIn *signIn = [GIDSignIn sharedInstance];
        signIn.shouldFetchBasicProfile = YES;
        signIn.delegate = self;
        signIn.clientID = @"314133874140-ptcg59nt6loq7655s7jl7agheu9pm0po.apps.googleusercontent.com";
        _statusAuthention = NO;
    }
    return self;
}

- (BOOL)reportAuthenticatedStatus
{
    SLLAccount *account = [self refreshUserInfo];
    [self.interactor dataAuthenticationForUser:account];
    return account ? YES : NO;
}

- (SLLAccount *)refreshUserInfo
{
    GIDAuthentication *auth = [GIDSignIn sharedInstance].currentUser.authentication;
    if (!auth)
    {
        return nil;
    }
    SLLAccount *accountSelf = [SLLAccount new];
    accountSelf.email = [GIDSignIn sharedInstance].currentUser.profile.email;
    accountSelf.name = [GIDSignIn sharedInstance].currentUser.profile.name;
    
    if (![GIDSignIn sharedInstance].currentUser.profile.hasImage)
    {
        return accountSelf;
    }
    NSURL *imageURL = [[GIDSignIn sharedInstance].currentUser.profile imageURLWithDimension:100];
    accountSelf.avatarURL = imageURL.absoluteString;
    return accountSelf;
}


#pragma mark -  GIDSignInDelegate

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error
{
    if (error)
    {
        [NSString stringWithFormat:@"Status: Authentication error: %@", error];
        return;
    }
    self.statusAuthention = [self reportAuthenticatedStatus];
    [self checkAuthenticationService];
}

- (void)signIn:(GIDSignIn *)signIn didDisconnectWithUser:(GIDGoogleUser *)user withError:(NSError *)error
{
    self.statusAuthention = [self reportAuthenticatedStatus];
    [self checkAuthenticationService];
}


#pragma mark -  SLLAuthenticationServiceInputProtocol

- (void)checkAuthenticationService
{
    [self.interactor isAuthenticationService:self.statusAuthention];
}

- (void)sigOutAuthenticationService
{
    [[GIDSignIn sharedInstance] signOut];
    self.statusAuthention = [self reportAuthenticatedStatus];
    [self checkAuthenticationService];
}


@end
