//
//  SLLChangesInteractor.h
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "../Service/SLLNetworkProtocol.h"
#import "SLLChangesInteractorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLLChangesInteractor : NSObject <SLLNetworkOutputProtocol, SLLChangesItercatorInputProtocol>

@property (nonatomic, weak, nullable) id<SLLNetworkInputProtocol> networkService;
@property (nonatomic, weak, nullable) id<SLLChangesItercatorOutputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
