//
//  SLLIntercatorProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 05/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//



@protocol SLLItercatorOutupProtocol <NSObject>

@optional

- (void)getChangeGerritForPresenter;

@end



@protocol SLLItercatorInputProtocol <NSObject>

@optional

- (void)dataForChangesisOpen;
- (void)dataForChangesisMerged;
- (void)dataForChangesisAbandoned;

@end
