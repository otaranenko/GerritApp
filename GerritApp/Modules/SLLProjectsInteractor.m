//
//  SLLProjectsInteractor.m
//  GerritApp
//
//  Created by Oleg Taranenko on 17/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProjectsInteractor.h"
#import "../Service/SLLNetworkCreateURL.h"


@implementation SLLProjectsInteractor 


#pragma mark -  SLLNetworkOutputProtocol

- (void)finishLoadingData:(NSDictionary<NSString *,NSString *> *)rawData
{
    NSLog(@"ddd %@", rawData);
}

- (void)finishLoadingParallelData:(NSDictionary<NSString *,id> *)rawData
{
    
}

- (void)finishLoadingSerialData:(NSData *)rawImage forData:(id)data
{
    NSLog(@"ddd %@", data);
}


#pragma mark -  SLLProjectsItercatorInputProtocol

- (void)dataForProjects
{
    NSArray <NSString *> *url = @[[SLLNetworkCreateURL createURLFromOneLevelType:SLLRequestTypeProject andTwoLevelType:SLLRequestTypeProjectAll]];
    [self.networkService startDownloadData:url];
}

@end
