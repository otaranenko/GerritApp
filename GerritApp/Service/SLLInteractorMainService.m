//
//  SLLInteractorMainService.m
//  GerritApp
//
//  Created by Oleg Taranenko on 05/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLInteractorMainService.h"


@implementation SLLInteractorMainService


#pragma mark -  SLLItercatorInputProtocol

- (void)dataForChangesisOpen
{
    [self.networkService downloadAllChangeGerrit];
}

- (void)dataForChangesisMerged
{
    
}

- (void)dataForChangesisAbandoned
{
    
}

- (void) finishLoadingData:(NSDictionary<NSString *, NSString *> *)rawData
{
   // NSDictionary *jsonList1 = [rawData copy];
    NSMutableArray *arrayID = [NSMutableArray new];
    for (id key in rawData)
    {
        NSNumber *ownerContainer = key[@"owner"][@"_account_id"];
        [arrayID addObject:ownerContainer];
    }
    NSArray<NSString *> *uniqueArray = [[NSOrderedSet orderedSetWithArray:[arrayID copy]] array];
    NSLog(@"ID ++ == %@", uniqueArray);
    NSLog(@"=====================");
    [self.networkService downloadAccountGerritForListID:uniqueArray];
}

- (void) loadingPartForAccountInfo:(NSDictionary<NSString *, NSString *> *)rawData
{
    NSLog(@"FINISH");
}

- (void) loadingPartForProjectInfo:(NSDictionary<NSString *, NSString *> *)rawData
{
    
}

@end
