//
//  SLLAccount.h
//  GerritApp
//
//  Created by Oleg Taranenko on 09/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLInternalData.h"

NS_ASSUME_NONNULL_BEGIN


@interface SLLAccount : NSObject <SLLInternalData>

@property (nonatomic, readonly) NSNumber *account_id;
@property (nonatomic, readonly) NSString *email;
@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSString *avatarURL;
@property (nonatomic, strong) NSData *avatarImage;

@end

NS_ASSUME_NONNULL_END
