//
//  SLLProjectsInteractor.m
//  GerritApp
//
//  Created by Oleg Taranenko on 17/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProjectsInteractor.h"
#import "SLLNetworkCreateURL.h"
#import "SLLProject.h"


@implementation SLLProjectsInteractor 


#pragma mark -  SLLNetworkOutputProtocol

- (void)finishLoadingData:(NSDictionary<NSString *,NSString *> *)rawData
{
    NSMutableDictionary<NSString *, SLLProject *> * dictionaryAccount = [NSMutableDictionary new ];
    int i = 0;
    for (id key in rawData.allValues)
    {
        SLLProject *project = [[SLLProject alloc] initWithDictionary:key];
        project.nameProject = [rawData allKeys][i];
        [dictionaryAccount setObject:project forKey:[rawData allKeys][i]];
        i++;
    }
    [self.presenter presentDataForDictionaryAccount:[dictionaryAccount copy]];
}

- (void)finishLoadingParallelData:(NSDictionary<NSString *,id> *)rawData
{
    //TO DO
}

- (void)finishLoadingSerialData:(NSData *)rawImage forData:(id)data
{
    //TO DO
}


#pragma mark -  SLLProjectsItercatorInputProtocol

- (void)dataForProjects
{
    NSArray <NSString *> *url = @[[SLLNetworkCreateURL createURLFromOneLevelType:SLLRequestTypeProject andTwoLevelType:SLLRequestTypeProjectAll]];
    [self.networkService startDownloadData:url];
}

@end
