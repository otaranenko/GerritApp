//
//  SLLAccountPresenterProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#include "SLLInternalData.h"

@class UIViewController;


@protocol SLLAccountPresenterOutputProtocol <NSObject>

- (void)setTableViewForCellDataAccount:(NSDictionary<NSString *, id<SLLInternalData> > *)data;

@end


@protocol SLLAccountPresenterInputProtocol <NSObject>

- (void)getDataForProjectsList;

@end
