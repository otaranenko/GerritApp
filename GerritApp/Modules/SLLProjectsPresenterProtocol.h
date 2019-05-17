//
//  SLLProjectsPresenterProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 17/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#import "SLLInternalData.h"


@class UIViewController;


@protocol SLLProjectsPresenterOutputProtocol <NSObject>

- (void)setTableViewForCellData:(NSArray<id<SLLInternalData> > *)data;

@end


@protocol SLLProjectsPresenterInputProtocol <NSObject>

- (void)getDataForProjectsList;

@end
