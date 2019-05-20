//
//  SLLAccountCoreData+CoreDataClass.h
//  GerritApp
//
//  Created by Oleg Taranenko on 13/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SLLAccount;

NS_ASSUME_NONNULL_BEGIN


@interface SLLAccountCoreData : NSManagedObject

+ (instancetype)accountCoreDataWithContext:(NSManagedObjectContext *)context;
+ (instancetype)accountCoreDataWithContext:(NSManagedObjectContext *)context internalData:(SLLAccount *)data;
+ (NSString *)entityName;

@end

NS_ASSUME_NONNULL_END

#import "SLLAccountCoreData+CoreDataProperties.h"
