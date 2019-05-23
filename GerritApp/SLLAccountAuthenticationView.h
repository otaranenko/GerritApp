//
//  SLLAccountAuthenticationView.h
//  GerritApp
//
//  Created by Oleg Taranenko on 21/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLLAccountPresenterProtocol.h"


NS_ASSUME_NONNULL_BEGIN


@interface SLLAccountAuthenticationView : UIViewController

@property (nonatomic, weak, nullable) id<SLLAccountPresenterInputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
