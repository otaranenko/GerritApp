//
//  SLLChangesRouter.h
//  GerritApp
//
//  Created by Oleg Taranenko on 07/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLChangesRouterProtocol.h"

@class UIViewController;

NS_ASSUME_NONNULL_BEGIN


@interface SLLChangesRouter : NSObject <SLLChangesRouterProtocol>

- (void)presentDetailViewController:(UIViewController *)viewController;

@end

NS_ASSUME_NONNULL_END
