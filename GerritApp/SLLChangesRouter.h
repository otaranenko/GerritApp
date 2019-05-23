//
//  SLLChangesRouter.h
//  GerritApp
//
//  Created by Oleg Taranenko on 07/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLChangesRouterProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface SLLChangesRouter : NSObject <SLLChangesRouterProtocol>

@property (nonatomic, weak, nullable) UIViewController *view;
@property (nonatomic, weak, nullable) UIViewController *viewDetail;

@end

NS_ASSUME_NONNULL_END
