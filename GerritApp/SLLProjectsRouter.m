//
//  SLLProjectsRouter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 07/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProjectsRouter.h"
#import <SafariServices/SFSafariViewController.h>



@implementation SLLProjectsRouter


#pragma mark -  SLLProjectsRouterProtocol

- (void)presentBrowserForLoadProject:(SLLProject *)projectData forView:(UIViewController *)view
{
     SFSafariViewController *safariController = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:projectData.webLinkURL]];
    [view presentViewController:safariController animated:YES completion:nil];
    
}

@end
