//
//  SLLNetworkCreateURL.h
//  GerritApp
//
//  Created by Oleg Taranenko on 22/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SLLRequestLeveLType) {
    SLLRequestTypeNil,
    SLLRequestTypeChange = 1,
    SLLRequestTypeProject,
    SLLRequestTypeAccount,
    SLLRequestTypeChangeForOpen = 32,
    SLLRequestTypeChangeForMerged,
    SLLRequestTypeChangeForAbandoned,
    SLLRequestTypeProjectAll
};


/**
Обертка для сборки строк URL запросов к REST API Gerrit
 */
@interface SLLNetworkCreateURL : NSObject

+ (NSString *)createURLFromAccountId:(NSString *)idNumber;
+ (NSString *)createURLFromOneLevelType:(SLLRequestLeveLType)oneType;
+ (NSString *)createURLFromOneLevelType:(SLLRequestLeveLType)oneType andTwoLevelType:(SLLRequestLeveLType)twoType;
+ (NSString *)formatTypeToString:(SLLRequestLeveLType)formatType;

@end

NS_ASSUME_NONNULL_END
