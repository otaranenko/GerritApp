//
//  SLLAccountInteractor.m
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountInteractor.h"
#import "SLLNetworkCreateURL.h"


@interface SLLAccountInteractor ()

@property (nonatomic, strong)SLLAccount *accountSelf;

@end


@implementation SLLAccountInteractor

- (void) loadAccountIDForSelf:(SLLAccount *)accountSelf
{
    NSString *requestString = [NSString stringWithFormat:@"%@",accountSelf.email];
    NSArray <NSString *> *url = @[[SLLNetworkCreateURL createURLFromCustomString:requestString]];
    [self.networkService startDownloadData:url];
}

#pragma mark -  SLLNetworkOutputProtocol

- (void)finishLoadingData:(NSDictionary<NSString *,NSString *> *)rawData
{
}

- (void)finishLoadingParallelData:(NSDictionary<NSString *,id> *)rawData
{
    NSLog(@"%@", rawData);
    
    SLLAccount *account = [[SLLAccount alloc] initWithDictionary:rawData];
    self.accountSelf.account_id = account.account_id;
    // account.avatarImage = rawImage;
    [self.presenter presentDataSelfAccount:self.accountSelf];
    //[self.presenter presentDataSelfAccount:account];
}

- (void)finishLoadingSerialData:(NSData *)rawImage forData:(id)data
{
    if (![data isKindOfClass:[SLLAccount class]])
    {
        return;
    }
    SLLAccount *account = data;
    account.avatarImage = rawImage;
    [self.presenter presentDataSelfAccount:account];
}


#pragma mark -  SLLAccountItercatorInputProtocol

- (void)dataForProjects
{
    NSArray <NSString *> *url = @[[SLLNetworkCreateURL createURLFromCustomString:@"?q=name:John+email:example.com"]];
    [self.networkService startDownloadData:url];
    
//    "_account_id": 1077962,
//    "name": "LocaL LocaL",
//    "email": "soullocal@gmail.com",
}

- (void)checkAuth
{
    [self.authenticationService checkAuthenticationService];
}

- (void)sigOutAccount {
    [self.authenticationService sigOutAuthenticationService];
}




- (void)dataAuthenticationForUser:(SLLAccount *)accountSelf
{
    if (accountSelf.avatarURL)
    {
        [self.networkService startDownloadImage:accountSelf.avatarURL forTransferData:accountSelf];
    }
    self.accountSelf = accountSelf;
    [self loadAccountIDForSelf:accountSelf];
}

- (void)isAuthenticationService:(BOOL)isAuth
{
    if (!isAuth)
    {
        self.accountSelf = nil;
    }
    [self.presenter presentStatusAuthentication:isAuth];
}

@end
