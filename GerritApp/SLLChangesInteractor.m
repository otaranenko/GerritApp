//
//  SLLChangesIteractor.m
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesInteractor.h"
#import "SLLNetworkCreateURL.h"
#import "SLLChange.h"
#import "SLLAccount.h"


@implementation SLLChangesInteractor


#pragma mark -  SLLChangesItercatorInputProtocol

- (void)dataForChangesForID
{
    
}

- (void)dataForChangesisAbandoned
{
    NSArray <NSString *> *url = @[[SLLNetworkCreateURL createURLFromOneLevelType:SLLRequestTypeChange andTwoLevelType:SLLRequestTypeChangeForAbandoned]];
    [self.networkService startDownloadData:url];
}

- (void)dataForChangesisMerged
{
    NSArray <NSString *> *url = @[[SLLNetworkCreateURL createURLFromOneLevelType:SLLRequestTypeChange andTwoLevelType:SLLRequestTypeChangeForMerged]];
    [self.networkService startDownloadData:url];
}

- (void)dataForChangesisOpen
{
    NSArray <NSString *> *url = @[[SLLNetworkCreateURL createURLFromOneLevelType:SLLRequestTypeChange andTwoLevelType:SLLRequestTypeChangeForOpen]];
    [self.networkService startDownloadData:url];
}

- (void)dataForAccountGerritForListID:(NSArray<NSString *> *)listAccountID
{
    if (!listAccountID)
    {
        return;
    }
    
    NSMutableArray *arrayURL = [NSMutableArray new];
    for (NSString *accountID in listAccountID)
    {
        [arrayURL addObject:[SLLNetworkCreateURL createURLFromAccountId:accountID] ];
    }
    [self.networkService startDownloadData:arrayURL];
}


#pragma mark -  SLLNetworkOutputProtocol

- (void)finishLoadingData:(NSDictionary<NSString *, id> *)rawData
{
    if (!rawData)
    {
        return;
    }
    
    NSMutableArray <SLLChange *>  *arrayChange = [NSMutableArray new];
    NSMutableArray  *arrayID = [NSMutableArray new];
    for (id key in rawData)
    {
        NSNumber *ownerContainer = key[@"owner"][@"_account_id"];
        [arrayChange addObject:[[SLLChange alloc] initWithDictionary:key]];
        [arrayID addObject:ownerContainer];
    }
    
    [self.presenter presentDataForChange:arrayChange];
    NSArray<NSNumber *> *uniqueArray = [[NSOrderedSet orderedSetWithArray:[arrayID copy]] array];
    NSDictionary<NSNumber *, SLLAccount *> * dictionaryAccount = [self.coreDataService getDataForCoreData];
    
    NSMutableArray <NSNumber *>  *arrayAccountIdCoreData = [NSMutableArray arrayWithArray:[dictionaryAccount allKeys]];
    NSMutableArray *array = [NSMutableArray arrayWithArray:uniqueArray];
    [array removeObjectsInArray:arrayAccountIdCoreData];
    
    [self.presenter presentDataForDictionaryAccount:dictionaryAccount];
    [self dataForAccountGerritForListID:[array copy]];
}

- (void)finishLoadingParallelData:(NSDictionary<NSString *, id<SLLInternalData>> *)rawData
{
    SLLAccount *account = [[SLLAccount alloc] initWithDictionary:rawData];
    [self.networkService startDownloadImage:account.avatarURL forTransferData:account];
}

- (void)finishLoadingSerialData:(NSData *)rawImage forData:(id)data
{
    if (![data isKindOfClass:[SLLAccount class]])
    {
        return;
    }
    
    SLLAccount *account = data;
    account.avatarImage = rawImage;
    [self.presenter presentDataForAccount:account];
    [self.coreDataService setDataForCoreData:account];
}


@end
