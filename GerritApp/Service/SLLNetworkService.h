//
//  SLLNetworkService.h
//  GerritApp
//
//  Created by Oleg Taranenko on 12/03/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SLLNetworkInputProtocol;
@protocol SLLNetworkOutputProtocol;

NS_ASSUME_NONNULL_BEGIN


@interface SLLNetworkService : NSObject <SLLNetworkInputProtocol>

@property (nonatomic, weak, nullable) id<SLLNetworkOutputProtocol> interactor;

- (void)startConnection;

@end

NS_ASSUME_NONNULL_END
