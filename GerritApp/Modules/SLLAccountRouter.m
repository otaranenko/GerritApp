//
//  SLLAccountRouter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 07/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountRouter.h"
#import "SLLAccountViewController.h"


@interface SLLAccountRouter ()

@property (nonatomic, strong) SLLAccountViewController *viewController;

@end


@implementation SLLAccountRouter

- (UIViewController *)assemblyModuleAccount:(id<SLLItercatorInputProtocol>)interactor
{
    self.viewController = [SLLAccountViewController new];
    return self.viewController;
}

@end
