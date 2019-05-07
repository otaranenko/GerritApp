//
//  SLLProjectRouter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 07/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProjectRouter.h"
#import "SLLProjectViewController.h"

@interface SLLProjectRouter ()

@property (nonatomic, strong) SLLProjectViewController *viewController;

@end


@implementation SLLProjectRouter


- (UIViewController *)assemblyModuleProject:(id<SLLItercatorInputProtocol>)interactor
{
    self.viewController = [SLLProjectViewController new];
    return self.viewController;
}


@end
