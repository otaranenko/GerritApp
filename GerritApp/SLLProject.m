//
//  SLLProject.m
//  GerritApp
//
//  Created by Oleg Taranenko on 19/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProject.h"


@interface SLLProject ()

@property (nonatomic, strong) NSString *idProject;
@property (nonatomic, assign) SLLProjectStateType idState;
@property (nonatomic, strong) NSString *webLinkURL;

@end


@implementation SLLProject


- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    self = [super init];
    if (self)
    {
        _idProject = [dictionary objectForKey:@"id"];
        _idState = [self convertForStringState:[dictionary objectForKey:@"state"]];
        _webLinkURL = [dictionary objectForKey:@"web_links"][0][@"url"];
    }
    return self;
}

- (SLLProjectStateType)convertForStringState:(NSString *)string
{
    if ([string containsString:@"ACTIVE"])
    {
        return SLLStateTypeActive;
    }
    else if ([string containsString:@"READ_ONLY"])
    {
        return SLLStateTypeReadOnly;
    }
    else if ([string containsString:@"HIDDEN"])
    {
        return SLLStateTypeReadOnly;
    }
    return SLLStateTypeNil;
}


- (nonnull id)copyWithZone:(nullable NSZone *)zone
{
    SLLProject *copy = [[SLLProject alloc] init];
    copy.nameProject = [_nameProject copy];
    copy.idProject = [_idProject copy];
    copy.idState = _idState;
    copy.webLinkURL = [_webLinkURL copy];
    return copy;
}

@end
