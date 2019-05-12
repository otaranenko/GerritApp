//
//  SLLChangesRouterProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

@class UIViewController;

@protocol SLLChangesRouter <NSObject>

- (void)presentDetailViewController:(UIViewController *)viewController;

@end
