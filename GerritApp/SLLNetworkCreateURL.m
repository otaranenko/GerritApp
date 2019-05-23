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

+ (NSString *)createURLFromCustomString:(NSString *)string
{
    if (!string)
    {
        return nil;
    }
    return [NSString stringWithFormat:@"https://%@/%@/%@", SLLdomainNameString, [SLLNetworkCreateURL formatTypeToString:SLLRequestTypeAccount], string] ;
}

+ (NSString *)createURLFromAccountId:(NSString *)idNumber
{
    if (!idNumber)
    {
        return nil;
    }
    
    return [NSString stringWithFormat:@"https://%@/%@/%@", SLLdomainNameString,
            [SLLNetworkCreateURL formatTypeToString:SLLRequestTypeAccount], idNumber];
}

+ (NSString *)createURLFromOneLevelType:(SLLRequestLeveLType)oneType
{
    return [SLLNetworkCreateURL createURLFromOneLevelType:oneType andTwoLevelType:SLLRequestTypeNil];
}

+ (NSString *)createURLFromOneLevelType:(SLLRequestLeveLType)oneType andTwoLevelType:(SLLRequestLeveLType)twoType;
{
    if (oneType > 32)
    {
        [NSException raise:NSGenericException format:@"Wrong enum type for one parametr!"];
    }
    return [NSString stringWithFormat:@"https://%@/%@/%@",
            SLLdomainNameString, [SLLNetworkCreateURL formatTypeToString:oneType],
            [SLLNetworkCreateURL formatTypeToString:twoType]];
}

+ (NSString *)formatTypeToString:(SLLRequestLeveLType)formatType
{    
    NSString *result = nil;

    switch(formatType)
    {
        case SLLRequestTypeNil:
            result = @"";
            break;
        case SLLRequestTypeChange:
            result = @"changes";
            break;
        case SLLRequestTypeAccount:
            result = @"accounts";
            break;
        case SLLRequestTypeProject:
            result = @"projects";
            break;
        case SLLRequestTypeChangeForOpen:
            result = @"?q=status:open";
            break;
        case SLLRequestTypeChangeForMerged:
            result = @"?q=status:merged";
            break;
        case SLLRequestTypeChangeForAbandoned:
            result = @"?q=status:abandoned";
            break;
        case  SLLRequestTypeProjectAll:
            result = @"?all";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unknown type."];
    }
    
    return result;
}

@end
