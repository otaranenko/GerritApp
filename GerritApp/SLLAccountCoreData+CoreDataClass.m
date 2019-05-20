//
//  SLLAccountCoreData+CoreDataClass.m
//  GerritApp
//
//  Created by Oleg Taranenko on 13/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
//

#import "SLLAccountCoreData+CoreDataClass.h"
#import "SLLAccount.h"


@implementation SLLAccountCoreData

+ (instancetype)accountCoreDataWithContext:(NSManagedObjectContext *)context;
{
    SLLAccountCoreData *objectAccountCoreData = [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
    
    return objectAccountCoreData;
}

+ (instancetype)accountCoreDataWithContext:(NSManagedObjectContext *)context internalData:(SLLAccount *)data
{
    SLLAccountCoreData *objectACcountCoreData = [self accountCoreDataWithContext:context];
    objectACcountCoreData.idAccount = [NSDecimalNumber decimalNumberWithDecimal:[data.account_id decimalValue]];
    objectACcountCoreData.name = data.name;
    objectACcountCoreData.email = data.email;
    objectACcountCoreData.avatarURL = data.avatarURL;
    objectACcountCoreData.avatarImage = data.avatarImage;
    
    return objectACcountCoreData;
}

+ (NSString *)entityName
{
    return NSStringFromClass([self class]);
}

@end
