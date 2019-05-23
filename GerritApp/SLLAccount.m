//
//  SLLAccount.m
//  GerritApp
//
//  Created by Oleg Taranenko on 09/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccount.h"
#import "SLLAccountCoreData+CoreDataClass.h"

static NSUInteger SLLImageURLWithDimension = 32;


@implementation SLLAccount

- (instancetype)initWithDictionary:(NSDictionary <NSString *, id> *)dictionary
{
    self = [super init];
    if (self)
    {
        _account_id = [dictionary objectForKey:@"_account_id"];
        _name = [dictionary objectForKey:@"name"];
        _email = [dictionary objectForKey:@"email"];
        
        for (id key in [dictionary objectForKey:@"avatars"])
        {
            if ([[key objectForKey:@"height"]   isEqual: @(SLLImageURLWithDimension)])
            {
                _avatarURL = [key objectForKey:@"url"];
                break;
            }
        }
    }
    return self;
}

- (instancetype)initWithCoreData:(NSManagedObject *)object
{
    self = [super init];
    if (self && [object isKindOfClass:[SLLAccountCoreData class]])
    {
        SLLAccountCoreData *accountCoreData = (SLLAccountCoreData *)object;
        _account_id = accountCoreData.idAccount;
        _name = accountCoreData.name;
        _email = accountCoreData.name;
        _avatarURL = accountCoreData.avatarURL;
        _avatarImage = accountCoreData.avatarImage;
    }
    return self;
}


#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    SLLAccount *copy = [[SLLAccount alloc] init];
    copy.account_id = [_account_id copy];
    copy.name = [_name copy];
    copy.email = [_email copy];
    copy.avatarURL = [_avatarURL copy];
    copy.avatarImage = [_avatarImage copy];
    return copy;
}

@end

