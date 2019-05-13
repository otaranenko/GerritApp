//
//  SLLCoreDataService.h
//  GerritApp
//
//  Created by Oleg Taranenko on 13/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SLLCoreDataProtocol.h"


NS_ASSUME_NONNULL_BEGIN


/**
 Сервис для взаимодействия с данными, получаеммыми из Core Data
 */
@interface SLLCoreDataService : NSObject <SLLCoreDataInputProtocol>

@property (nonatomic, weak, nullable) id<SLLCoreDataOutputProtocol> interactor;

@end

NS_ASSUME_NONNULL_END
