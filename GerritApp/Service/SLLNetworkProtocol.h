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

@protocol SLLNetworkInputProtocol <NSObject>

@optional

- (void)startConnection;
- (void)getChangeInfoForGerritForTime:(NSDate *)date;
- (void)getAccountInfoForGerritForTime:(NSDate *)date;
- (void)getProjectInfoForGerritForTime:(NSDate *)date;

@end


@protocol SLLNetworkOutputProtocol <NSObject>

@optional

- (void) loadingPartForChangeInfo:(NSData *)rawData;
- (void) loadingPartForAccountInfo:(NSData *)rawData;
- (void) loadingPartForProjectInfo:(NSData *)rawData;

@end

#endif /* SLLNetworkProtocol_h */
