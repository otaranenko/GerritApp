//
//  SLLNetworkCreateURL.m
//  GerritApp
//
//  Created by Oleg Taranenko on 22/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLNetworkCreateURL.h"


static NSString *const SLLdomainNameString = @"gerrit-review.googlesource.com";
static NSString *const SLLgetStatusChangeForOpen = @"?q=status:open";
static NSString *const SLLgetStatusChangeForMerged = @"?q=status:merged";
static NSString *const SLLgetStatusChangeForAbandoned = @"?q=status:abandoned";
//https://gerrit-review.googlesource.com/changes/?q=status:open

@implementation SLLNetworkCreateURL

+ (NSString *)infoAccountFromId:(NSString *)id
{
    return [NSString stringWithFormat:@"https://%@/accounts/", SLLdomainNameString ];
}

+ (NSString *)infoProjectFrom
{
    return [NSString stringWithFormat:@"https://%@/projects/", SLLdomainNameString ];
}

+ (NSString *)infoChangeForParameters:(NSString *)string
{
    return [NSString stringWithFormat:@"https://%@/changes/%@", SLLdomainNameString, string];
}

+ (NSString *)infoChangeForOpen
{
    return [self infoChangeForParameters:SLLgetStatusChangeForOpen];
}

+ (NSString *)infoChangeForMerged
{
    return [self infoChangeForParameters:SLLgetStatusChangeForMerged];
}

+ (NSString *)infoChangeForAbandoned
{
    return [self infoChangeForParameters:SLLgetStatusChangeForAbandoned];
}

@end
