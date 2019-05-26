//
//  CAGradientLayer+SLLGradients.h
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface CAGradientLayer (SLLGradients)

/**
 Шаблон создания объектов типа GradientLayer
 
 @return возращает созданный и настроенный CAGradientLayer
 */
+ (CAGradientLayer *)sll_linearGradientLayer;

@end

NS_ASSUME_NONNULL_END
