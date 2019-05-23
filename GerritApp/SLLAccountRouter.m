//
//  SLLAccountRouter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 07/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountRouter.h"
#import "SLLAccountAuthenticationView.h"


@implementation SLLAccountRouter


#pragma mark -  SLLAccountRouterProtocol

- (void)presentViewControllerAuthentication
{
    self.viewAuthentication.modalPresentationStyle = UIModalPresentationCustom;
    [self.view.navigationController pushViewController:self.viewAuthentication animated:YES];
}

- (void)dismissViewControllerAuthentication
{
    [self.view.navigationController popToRootViewControllerAnimated:YES];
}

@end
