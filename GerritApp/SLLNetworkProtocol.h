//
//  SLLNetworkProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 07/03/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLInternalData.h"


/**
 Контракт взаимодействия со внешним слоем (Interactor)
 Воздействие из Interactora
 */
@protocol SLLNetworkInputProtocol <NSObject>

@required
- (BOOL)startDownloadData:(NSArray<NSString *> *)listUrls;
- (BOOL)startDownloadImage:(NSString *)url forTransferData:(id<SLLInternalData>)transferData;

@end


/**
 Контракт взаимодействия со внешним слоем (Interactor)
 Результат (Notification) в Interactor
 */
@protocol SLLNetworkOutputProtocol <NSObject>

@required
- (void)finishLoadingData:(NSDictionary<NSString *, NSString *> *)rawData;
- (void)finishLoadingParallelData:(NSDictionary<NSString *, id> *)rawData;
- (void)finishLoadingSerialData:(NSData *)rawImage forData:(id)data;

@end
