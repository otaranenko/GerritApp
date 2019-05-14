//
//  SLLAccountCoreData+CoreDataProperties.m
//  GerritApp
//
//  Created by Oleg Taranenko on 13/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
//

#import "SLLAccountCoreData+CoreDataProperties.h"

@implementation SLLAccountCoreData (CoreDataProperties)

+ (NSFetchRequest<SLLAccountCoreData *> *)fetchRequest
{
	return [NSFetchRequest fetchRequestWithEntityName:@"SLLAccountCoreData"];
}

+ (NSFetchRequest<SLLAccountCoreData *> *)fetchRequestForAccountId
{
    NSFetchRequest *fetchRequest = [SLLAccountCoreData fetchRequest];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"idAccount" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    return fetchRequest;
}

@dynamic idAccount;
@dynamic name;
@dynamic email;
@dynamic avatarURL;
@dynamic avatarImage;

@end
