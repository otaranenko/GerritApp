//
//  SLLNetworkProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 07/03/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 <#Description#>
 */
@protocol SLLNetworkInputProtocol <NSObject>

@required
- (void)startDownloadData:(NSArray<NSString *> *)listUrls;
- (void)startDownloadImage:(NSString *)url forTransferData:(id)transferData;

@end



/**
 <#Description#>
 */
@protocol SLLNetworkOutputProtocol <NSObject>

@required
- (void)finishLoadingData:(NSDictionary<NSString *, NSString *> *)rawData;
- (void)finishLoadingParallelData:(NSDictionary<NSString *, id> *)rawData;
- (void)finishLoadingSerialData:(NSData *)rawImage forData:(id)data;


@end
