//
//  SLLChangesDetailViewController.h
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLLChangesPresenterProtocol.h"

NS_ASSUME_NONNULL_BEGIN


@interface SLLChangesDetailViewController : UIViewController

@property (nonatomic, weak, nullable) id<SLLChangesPresenterInputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
