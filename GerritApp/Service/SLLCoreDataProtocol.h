//
//  SLLCoreDataProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 13/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#import "../Modules/SLLInternalData.h"

/**
 Контракт взаимодействия со внешним слоем (Interactor)
 Воздействие из Interactora
 */
@protocol SLLCoreDataInputProtocol <NSObject>

@required

- (void)getDataForCoreData:(id<SLLInternalData>)data;
- (void)setDataForCoreData:(id<SLLInternalData>)data;

@end


/**
 Контракт взаимодействия со внешним слоем (Interactor)
 Результат (Notification) в Interactor
 */
@protocol SLLCoreDataOutputProtocol <NSObject>

@required
- (void)finishLoadingCoreData:(NSDictionary<NSString *, NSString *> *)rawData;



@end
