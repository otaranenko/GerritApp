    //
//  SLLChangesRouter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 07/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesRouter.h"
#import "SLLChangesDetailViewController.h"


@interface SLLChangesRouter ()

@end


@implementation SLLChangesRouter

- (void)presentDetailViewController:(UIViewController *)viewController {
  
    SLLChangesDetailViewController *detailViewController = [SLLChangesDetailViewController new];
    detailViewController.modalPresentationStyle = UIModalPresentationCustom;
    [viewController.navigationController pushViewController:detailViewController animated:YES ];
}


@end
