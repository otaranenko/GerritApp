//
//  SLLAccount.m
//  GerritApp
//
//  Created by Oleg Taranenko on 09/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccount.h"


@interface SLLAccount ()

@property (nonatomic, strong) NSNumber *account_id;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *avatarURL;

@end


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
            if ([[key objectForKey:@"height"]   isEqual: @(32)])
            {
                _avatarURL = [key objectForKey:@"url"];
                break;
            }
        }
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
