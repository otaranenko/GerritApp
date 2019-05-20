//
//  SLLNetworkService.h
//  GerritApp
//
//  Created by Oleg Taranenko on 12/03/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLLNetworkProtocol.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Сервис для взаимодействия с данными, получаеммыми из сети
 */
@interface SLLNetworkService : NSObject <SLLNetworkInputProtocol>

@property (nonatomic, weak, nullable) id<SLLNetworkOutputProtocol> interactor;

@end

NS_ASSUME_NONNULL_END
