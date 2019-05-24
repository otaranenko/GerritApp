//
//  UILabel+SLLDesign.m
//  GerritApp
//
//  Created by Oleg Taranenko on 24/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "UILabel+SLLDesign.h"


@implementation UILabel (SLLDesign)

+ (UILabel *)sll_createLabelForView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    label.textColor = [UIColor whiteColor];
    [view addSubview:label];
    return label;
}

@end
