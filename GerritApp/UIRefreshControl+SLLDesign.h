//
//  UIRefreshControl+SLLDesign.h
//  GerritApp
//
//  Created by Oleg Taranenko on 24/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UIRefreshControl (SLLDesign)

/**
 Шаблон создания объектов типа RefreshControl
 
 @return возращает созданный и настроенный UIRefreshControl
 */
+ (UIRefreshControl *)sll_createRefreshControl:(SEL )selector;

@end

NS_ASSUME_NONNULL_END
