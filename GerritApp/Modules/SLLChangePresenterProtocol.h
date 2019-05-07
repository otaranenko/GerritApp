//
//  SLLChangePresenterProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//


@protocol SLLChangePresenterOutputProtocol <NSObject>

- (void)setTableViewForCellData:(NSArray<NSString *> *)data;

@end



@protocol SLLChangePresenterInputProtocol <NSObject>

- (void)getDataForChangesisOpen;
- (void)getDataForChangesisMerged;
- (void)getDataForChangesisAbandoned;

@end
