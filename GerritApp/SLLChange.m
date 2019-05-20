//
//  SLLChange.m
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChange.h"


@interface SLLChange ()

@property (nonatomic, strong) NSString *changeId;
@property (nonatomic, strong) NSNumber *changeNumber;
@property (nonatomic, strong) NSString *changeStatus;
@property (nonatomic, strong) NSString *changeProject;
@property (nonatomic, strong) NSString *changeSubject;
@property (nonatomic, strong) NSString *changeCountComment;
@property (nonatomic, strong) NSString *changeUnresolvedCountComment;
@property (nonatomic, strong) NSNumber *changeOwnerAccountId;
@property (nonatomic, strong) NSString *changeCreatedDate;

@end


@implementation SLLChange

- (instancetype)initWithDictionary:(NSDictionary <NSString *, id> *)dictionary
{
    self = [super init];
    if (self)
    {
        _changeId = [dictionary objectForKey:@"id"];
        _changeNumber = [dictionary objectForKey:@"_number"];
        _changeStatus = [dictionary objectForKey:@"status"];
        _changeProject = [dictionary objectForKey:@"project"];
        _changeSubject = [dictionary objectForKey:@"subject"];
        _changeCountComment = [dictionary objectForKey:@"total_comment_count"];
        _changeUnresolvedCountComment = [dictionary objectForKey:@"unresolved_comment_count"];
        _changeOwnerAccountId = [dictionary objectForKey:@"owner"][@"_account_id"];
        _changeUpdateDate = [dictionary objectForKey:@"updated"];
        _changeCreatedDate = [dictionary objectForKey:@"created"];
    }
    return self;
}


#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    SLLChange *copy = [[SLLChange alloc] init];
    copy.changeId = [_changeId copy];
    copy.changeNumber = [_changeNumber copy];
    copy.changeStatus = [_changeStatus copy];
    copy.changeProject = [_changeProject copy];
    copy.changeSubject = [_changeSubject copy];
    copy.changeCountComment = [_changeCountComment copy];
    copy.changeUnresolvedCountComment = [_changeUnresolvedCountComment copy];
    copy.changeOwnerAccountId = [_changeOwnerAccountId copy];
    copy.changeUpdateDate = [_changeUpdateDate copy];
    copy.changeCreatedDate = [_changeCreatedDate copy];
    return copy;
}


@end
