//
//  SLLProjectAssembly.m
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProjectAssembly.h"
#import "SLLProjectViewController.h"


@interface SLLProjectAssembly ()

@property (nonatomic, strong) SLLProjectViewController *viewController;

@end


@implementation SLLProjectAssembly


- (UIViewController *)assemblyModuleProject
{
    self.viewController = [SLLProjectViewController new];
    return self.viewController;
}

@end
