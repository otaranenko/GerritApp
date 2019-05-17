//
//  SLLChangesPresenter.h
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLChangesPresenterProtocol.h"
#import "SLLChangesRouterProtocol.h"
#import "SLLChangesInteractorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLLChangesPresenter : NSObject <SLLChangesPresenterInputProtocol, SLLChangesIntercatorOutputProtocol>

@property (nonatomic, weak, nullable) id<SLLChangesPresenterOutputProtocol> view;
@property (nonatomic, weak, nullable) id<SLLChangesItercatorInputProtocol> interactor;
@property (nonatomic, weak, nullable) id<SLLChangesRouterProtocol> router;

@end

NS_ASSUME_NONNULL_END
