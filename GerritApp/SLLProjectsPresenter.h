//
//  SLLProjectsPresenter.h
//  GerritApp
//
//  Created by Oleg Taranenko on 17/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLProjectsPresenterProtocol.h"
#import "SLLProjectsRouterProtocol.h"
#import "SLLProjectsInteractorProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface SLLProjectsPresenter : NSObject <SLLProjectsPresenterInputProtocol, SLLProjectsIntercatorOutputProtocol>

@property (nonatomic, weak, nullable) id<SLLProjectsPresenterOutputProtocol> view;
@property (nonatomic, weak, nullable) id<SLLProjectsItercatorInputProtocol> interactor;
@property (nonatomic, weak, nullable) id<SLLProjectsRouterProtocol> router;

@end

NS_ASSUME_NONNULL_END

