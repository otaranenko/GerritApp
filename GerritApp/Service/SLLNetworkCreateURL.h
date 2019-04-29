//
//  SLLNetworkCreateURL.h
//  GerritApp
//
//  Created by Oleg Taranenko on 22/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface SLLNetworkCreateURL : NSObject

+ (NSString *)infoAccountFromId:(NSString *)id;
+ (NSString *)infoProjectFrom;
+ (NSString *)infoChangeForOpen;
+ (NSString *)infoChangeForMerged;
+ (NSString *)infoChangeForAbandoned;

@end

NS_ASSUME_NONNULL_END
