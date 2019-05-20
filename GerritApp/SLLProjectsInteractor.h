//
//  SLLProjectsInteractor.h
//  GerritApp
//
//  Created by Oleg Taranenko on 17/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLNetworkProtocol.h"
#import "SLLCoreDataProtocol.h"
#import "SLLProjectsInteractorProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface SLLProjectsInteractor : NSObject <SLLNetworkOutputProtocol, SLLProjectsItercatorInputProtocol, SLLCoreDataOutputProtocol>

@property (nonatomic, weak, nullable) id<SLLNetworkInputProtocol> networkService;
@property (nonatomic, weak, nullable) id<SLLCoreDataInputProtocol> coreDataService;
@property (nonatomic, weak, nullable) id<SLLProjectsIntercatorOutputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
