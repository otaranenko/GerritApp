//
//  CAGradientLayer+SLLGradients.m
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "CAGradientLayer+SLLGradients.h"


@implementation CAGradientLayer (SLLGradients)

+ (CAGradientLayer *)sll_linearGradientLayer
{
    UIColor *topColor = [UIColor grayColor];
    UIColor *bottomColor = [UIColor lightGrayColor];
    NSArray *gradientColors = @[(id)topColor.CGColor, (id)bottomColor.CGColor];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    
    return gradientLayer;
}

@end
