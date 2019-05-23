    //
//  SLLChangesRouter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 07/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesRouter.h"
#import <UIKit/UIKit.h>

@implementation SLLChangesRouter


#pragma mark -  SLLChangesRouterProtocol

- (void)presentDetailViewController
{
    self.viewDetail.modalPresentationStyle = UIModalPresentationCustom;
    [self.view.navigationController pushViewController:self.viewDetail animated:YES];
}


@end
