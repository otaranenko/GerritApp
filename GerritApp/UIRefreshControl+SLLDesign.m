//
//  UIRefreshControl+SLLDesign.m
//  GerritApp
//
//  Created by Oleg Taranenko on 24/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "UIRefreshControl+SLLDesign.h"


@implementation UIRefreshControl (SLLDesign)

+ (UIRefreshControl *)sll_createRefreshControl:(SEL )selector
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor grayColor];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Обновление"];
    [refreshControl addTarget:nil action:selector forControlEvents:UIControlEventValueChanged];
    
    return refreshControl;
}

@end
