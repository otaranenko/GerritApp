//
//  SLLChangesInteractorProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#import "SLLChange.h"
#import "SLLAccount.h"


@protocol SLLChangesItercatorInputProtocol <NSObject>

- (void)dataForChangesisAbandoned;
- (void)dataForChangesisMerged;
- (void)dataForChangesisOpen;
- (void)dataForChangesForID;

@end

@protocol SLLChangesIntercatorOutputProtocol <NSObject>

- (void)presentDataForChange:(NSArray<SLLChange *> *)data;
- (void)presentDataForDictionaryAccount:(NSDictionary<NSNumber *, SLLAccount *> *)data;
- (void)presentDataForAccount:(SLLAccount *)data;

@end
