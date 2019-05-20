//
//  SLLAccountViewController.h
//  GerritApp
//
//  Created by Oleg Taranenko on 28/02/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLLAccountPresenterProtocol.h"


@interface SLLAccountViewController : UIViewController <SLLAccountPresenterOutputProtocol>

@property (nonatomic, weak, nullable) id<SLLAccountPresenterInputProtocol> presenter;

@end

