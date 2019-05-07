//
//  SLLChangeViewController.h
//  GerritApp
//
//  Created by Oleg Taranenko on 23/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLLChangePresenterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLLChangeViewController : UIViewController <SLLChangePresenterOutputProtocol>

@property (nonatomic, weak, nullable) id<SLLChangePresenterInputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
