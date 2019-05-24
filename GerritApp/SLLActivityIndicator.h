//
//  SLLActivityIndicator.h
//  GerritApp
//
//  Created by Oleg Taranenko on 24/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface SLLActivityIndicator : UIActivityIndicatorView

+ (SLLActivityIndicator *)createActivityIndicatorForSubview:(UIView*)view;
- (void)startAnimating;
- (void)stopAnimating;

@end

NS_ASSUME_NONNULL_END
