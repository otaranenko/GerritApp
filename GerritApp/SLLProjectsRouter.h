//
//  SLLProjectsRouter.h
//  GerritApp
//
//  Created by Oleg Taranenko on 07/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLProjectsRouterProtocol.h"

@class SFSafariViewController;


NS_ASSUME_NONNULL_BEGIN


@interface SLLProjectsRouter : NSObject <SLLProjectsRouterProtocol>

@property (nonatomic, weak, nullable) UIViewController *view;

@end

NS_ASSUME_NONNULL_END
