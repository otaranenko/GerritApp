//
//  SLLProject.h
//  GerritApp
//
//  Created by Oleg Taranenko on 19/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLInternalData.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, SLLProjectStateType) {
    SLLStateTypeNil,
    SLLStateTypeActive,
    SLLStateTypeReadOnly,
    SLLStateTypeHidden
};

@interface SLLProject : NSObject <SLLInternalData>

@property (nonatomic, strong) NSString *nameProject;
@property (nonatomic, readonly) NSString *idProject;
@property (nonatomic, readonly) SLLProjectStateType idState;
@property (nonatomic, readonly) NSString *webLinkURL;

@end

NS_ASSUME_NONNULL_END
