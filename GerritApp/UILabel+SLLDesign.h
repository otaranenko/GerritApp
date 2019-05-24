//
//  UILabel+SLLDesign.h
//  GerritApp
//
//  Created by Oleg Taranenko on 24/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface UILabel (SLLDesign)

/**
 Шаблон создания объектов типа LabeL
 
 @return возращает созданный и настроенный UILabel
 */
+ (UILabel *)sll_createLabelForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
