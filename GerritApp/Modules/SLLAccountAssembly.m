//
//  SLLAccountAssembly.m
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountAssembly.h"
#import "SLLAccountViewController.h"


@interface SLLAccountAssembly ()

@property (nonatomic, strong) SLLAccountViewController *viewController;

@end


@implementation SLLAccountAssembly

- (UIViewController *)assemblyModuleAccount
{
    self.viewController = [SLLAccountViewController new];
    return self.viewController;
}

@end
