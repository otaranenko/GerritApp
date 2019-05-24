//
//  SLLChangePresenterProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChange.h"
#import "SLLAccount.h"
@class UIViewController;


@protocol SLLChangesPresenterOutputProtocol <NSObject>

- (void)setTableViewForCellData:(NSArray<SLLChange *> *)data;
- (void)setTableViewForCellDataAccount:(NSDictionary<NSNumber *, SLLAccount *> *)data;

@end


@protocol SLLChangesPresenterInputProtocol <NSObject>

- (void)getDataForChangesisOpen;
- (void)getDataForChangesisMerged;
- (void)getDataForChangesisAbandoned;
- (void)showDetailViewControllerFor:(UIViewController *)viewController;

@end
