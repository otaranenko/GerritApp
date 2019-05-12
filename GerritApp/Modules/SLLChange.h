//
//  SLLChange.h
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLInternalData.h"

NS_ASSUME_NONNULL_BEGIN


@interface SLLChange : NSObject <SLLInternalData>

@property (nonatomic, readonly) NSString *changeId;
@property (nonatomic, readonly) NSNumber *changeNumber;
@property (nonatomic, readonly) NSString *changeStatus;
@property (nonatomic, readonly) NSString *changeProject;
@property (nonatomic, readonly) NSString *changeSubject;
@property (nonatomic, readonly) NSString *changeCountComment;
@property (nonatomic, readonly) NSString *changeUnresolvedCountComment;
@property (nonatomic, readonly) NSNumber *changeOwnerAccountId;
@property (nonatomic, strong) NSString *changeUpdateDate;
@property (nonatomic, readonly) NSString *changeCreatedDate;


@end

NS_ASSUME_NONNULL_END
