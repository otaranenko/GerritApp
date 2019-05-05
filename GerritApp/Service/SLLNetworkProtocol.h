//
//  SLLNetworkProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 07/03/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#ifndef SLLNetworkProtocol_h
#define SLLNetworkProtocol_h


#import <Foundation/Foundation.h>

/**
 <#Description#>
 */
@protocol SLLNetworkInputProtocol <NSObject>

@optional

- (void)downloadAllChangeGerrit;
- (void)downloadSelfAccountGerrit;
- (void)downloadAllProjectGerrit;
- (void)downloadAccountGerritForListID:(NSArray<NSString *> *)listAccountID;

@end


/**
 <#Description#>
 */
@protocol SLLNetworkOutputProtocol <NSObject>

@optional

- (void) finishLoadingData:(NSDictionary<NSString *, NSString *> *)rawData;
- (void) loadingPartForAccountInfo:(NSDictionary<NSString *, NSString *> *)rawData;
- (void) loadingPartForProjectInfo:(NSDictionary<NSString *, NSString *> *)rawData;

@end

#endif /* SLLNetworkProtocol_h */
