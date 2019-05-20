//
//  SLLProjectsViewController.h
//  GerritApp
//
//  Created by Oleg Taranenko on 23/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLLProjectsPresenterProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface SLLProjectsViewController : UIViewController  <SLLProjectsPresenterOutputProtocol>

@property (nonatomic, weak, nullable) id<SLLProjectsPresenterInputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END

