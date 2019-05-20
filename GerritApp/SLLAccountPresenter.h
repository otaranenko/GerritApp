//
//  SLLAccountPresenter.h
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLAccountPresenterProtocol.h"
#import "SLLAccountRouterProtocol.h"
#import "SLLAccountInteractorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLLAccountPresenter : NSObject <SLLAccountPresenterInputProtocol, SLLAccountIntercatorOutputProtocol>

@property (nonatomic, weak, nullable) id<SLLAccountPresenterOutputProtocol> view;
@property (nonatomic, weak, nullable) id<SLLAccountIntercatorInputProtocol> interactor;
@property (nonatomic, weak, nullable) id<SLLAccountRouterProtocol> router;


@end

NS_ASSUME_NONNULL_END
