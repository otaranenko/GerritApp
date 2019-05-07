//
//  SLLChangePresenter.h
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLChangePresenterProtocol.h"
#import "../Service/SLLIntercatorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLLChangePresenter : NSObject <SLLChangePresenterInputProtocol, SLLItercatorOutupProtocol>

@property (nonatomic, weak) id<SLLChangePresenterOutputProtocol> view;
@property (nonatomic, weak) id<SLLItercatorInputProtocol> interactor;

@end

NS_ASSUME_NONNULL_END
