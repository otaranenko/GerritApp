//
//  SLLCoreDataProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 13/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#import "SLLInternalData.h"
#import "SLLAccountCoreData+CoreDataProperties.h"

/**
 Контракт взаимодействия со внешним слоем (Interactor)
 Воздействие из Interactora
 */
@protocol SLLCoreDataInputProtocol <NSObject>

- (NSDictionary<NSNumber *, SLLAccount*> *)getDataForCoreData;
- (BOOL)setDataForCoreData:(id<SLLInternalData>)data;

@end


/**
 Контракт взаимодействия со внешним слоем (Interactor)
 Результат (Notification) в Interactor
 */
@protocol SLLCoreDataOutputProtocol <NSObject>

@optional
- (void)finishLoadingCoreData:(NSDictionary<NSString *, NSString *> *)rawData;

@end
