//
//  SLLNetworkCreateURL.h
//  GerritApp
//
//  Created by Oleg Taranenko on 22/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, SLLNetworkRequestType) {
    SLLNetworkRequestTypeChange = 1,
    SLLNetworkRequestTypeChangeForOpen,
    SLLNetworkRequestTypeChangeForMerged,
    SLLNetworkRequestTypeChangeForAbandoned,
    SLLNetworkRequestTypeProject = 32,
    SLLNetworkRequestTypeAccount = 64
};


@interface SLLNetworkCreateURL : NSObject

+ (NSString *)infoAccountFromId:(NSString *)id;
+ (NSString *)infoProject;
+ (NSString *)infoChangeForParameters:(SLLNetworkRequestType )formatType;
+ (NSString *)formatTypeToString:(SLLNetworkRequestType)formatType;

@end

NS_ASSUME_NONNULL_END
