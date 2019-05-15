//
//  SLLNetworkCreateURL.m
//  GerritApp
//
//  Created by Oleg Taranenko on 22/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLNetworkCreateURL.h"


static NSString *const SLLdomainNameString = @"gerrit-review.googlesource.com";


@implementation SLLNetworkCreateURL

+ (NSString *)infoAccountFromId:(NSString *)idNumber
{
    if (!idNumber)
    {
        return nil;
    }
    
    return [NSString stringWithFormat:@"https://%@/%@/%@", SLLdomainNameString,
            [SLLNetworkCreateURL formatTypeToString:SLLNetworkRequestTypeAccount], idNumber];
}

+ (NSString *)infoProject
{
    return [NSString stringWithFormat:@"https://%@/%@/",
            SLLdomainNameString, [SLLNetworkCreateURL formatTypeToString:SLLNetworkRequestTypeProject]];
}

+ (NSString *)infoChangeForParameters:(SLLNetworkRequestType )formatType
{
    return [NSString stringWithFormat:@"https://%@/%@/%@",
            SLLdomainNameString, [SLLNetworkCreateURL formatTypeToString:SLLNetworkRequestTypeChange],
            [SLLNetworkCreateURL formatTypeToString:formatType]];
}

+ (NSString *)formatTypeToString:(SLLNetworkRequestType)formatType
{    
    NSString *result = nil;

    switch(formatType)
    {
        case SLLNetworkRequestTypeChange:
            result = @"changes";
            break;
        case SLLNetworkRequestTypeAccount:
            result = @"accounts";
            break;
        case SLLNetworkRequestTypeProject:
            result = @"projects";
            break;
        case SLLNetworkRequestTypeChangeForOpen:
            result = @"?q=status:open";
            break;
        case SLLNetworkRequestTypeChangeForMerged:
            result = @"?q=status:merged";
            break;
        case SLLNetworkRequestTypeChangeForAbandoned:
            result = @"?q=status:abandoned";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unknown type."];
    }
    
    return result;
}

@end
