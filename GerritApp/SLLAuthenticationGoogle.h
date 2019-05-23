//
//  SLLAuthenticationGoogle.h
//  GerritApp
//
//  Created by Oleg Taranenko on 22/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleSignIn/GoogleSignIn.h>
#import "SLLAuthenticationServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface SLLAuthenticationGoogle : NSObject <SLLAuthenticationServiceInputProtocol, GIDSignInDelegate>

@property (nonatomic, weak, nullable) id<SLLAuthenticationServiceOutputProtocol> interactor;
@property (nonatomic, assign) BOOL statusAuthention;

@end

NS_ASSUME_NONNULL_END
