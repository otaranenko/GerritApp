//
//  SLLAccountInteractor.h
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLCoreDataProtocol.h"
#import "SLLNetworkProtocol.h"
#import "SLLAccountInteractorProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface SLLAccountInteractor : NSObject <SLLNetworkOutputProtocol, SLLAccountIntercatorInputProtocol, SLLCoreDataOutputProtocol>

@property (nonatomic, weak, nullable) id<SLLNetworkInputProtocol> networkService;
@property (nonatomic, weak, nullable) id<SLLCoreDataInputProtocol> coreDataService;
@property (nonatomic, weak, nullable) id<SLLAccountIntercatorOutputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
