//
//  SLLInteractorMainService.h
//  GerritApp
//
//  Created by Oleg Taranenko on 05/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLNetworkProtocol.h"
#import "SLLIntercatorProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface SLLInteractorMainService : NSObject <SLLNetworkOutputProtocol, SLLItercatorOutupProtocol>

@property (nonatomic, weak, nullable) id<SLLNetworkInputProtocol> networkService;

@end

NS_ASSUME_NONNULL_END
