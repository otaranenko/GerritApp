//
//  SLLAccountCoreData+CoreDataProperties.h
//  GerritApp
//
//  Created by Oleg Taranenko on 13/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
//

#import "SLLAccountCoreData+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SLLAccountCoreData (CoreDataProperties)

+ (NSFetchRequest<SLLAccountCoreData *> *)fetchRequest;
+ (NSFetchRequest<SLLAccountCoreData *> *)fetchRequestForAccountId;

@property (nullable, nonatomic, copy) NSDecimalNumber *idAccount;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *avatarURL;
@property (nullable, nonatomic, retain) NSData *avatarImage;

@end

NS_ASSUME_NONNULL_END
