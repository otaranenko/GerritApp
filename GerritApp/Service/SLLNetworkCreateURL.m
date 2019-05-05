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

+ (NSString *)infoAccountFromId:(NSString *)id
{
    return [NSString stringWithFormat:@"https://%@/%@/%@", SLLdomainNameString,
            [SLLNetworkCreateURL formatTypeToString:SLLAccount], id];
}

+ (NSString *)infoProject
{
    return [NSString stringWithFormat:@"https://%@/%@/",
            SLLdomainNameString, [SLLNetworkCreateURL formatTypeToString:SLLProject]];
}

+ (NSString *)infoChangeForParameters:(SLLNetworkRequestType )formatType
{
    return [NSString stringWithFormat:@"https://%@/%@/%@",
            SLLdomainNameString, [SLLNetworkCreateURL formatTypeToString:SLLChange],
            [SLLNetworkCreateURL formatTypeToString:formatType]];
}

+ (NSString*)formatTypeToString:(SLLNetworkRequestType)formatType
{    
    NSString *result = nil;

    switch(formatType)
    {
        case SLLChange:
            result = @"changes";
            break;
        case SLLAccount:
            result = @"accounts";
            break;
        case SLLProject:
            result = @"projects";
            break;
        case SLLChangeForOpen:
            result = @"?q=status:open";
            break;
        case SLLChangeForMerged:
            result = @"?q=status:merged";
            break;
        case SLLChangeForAbandoned:
            result = @"?q=status:abandoned";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unknown type."];
    }
    
    return result;
}

@end
