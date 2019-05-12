//
//  SLLNetworkService.m
//  GerritApp
//
//  Created by Oleg Taranenko on 12/03/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLNetworkService.h"
#import "SLLNetworkCreateURL.h"


@interface SLLNetworkService () <NSURLSessionDownloadDelegate>

@property (nonatomic, strong) NSURLSessionDownloadTask *sessionDownloadTask;
@property (nonatomic, strong) NSURLSessionConfiguration *sessionConfiguration;
@property (nonatomic, strong) NSURLSession *urlSession;

@end



@implementation SLLNetworkService

- (NSData *)clearMagicSimbolsForRAWData:(NSData *)data
{
    NSString *prefixMagic = @")]}'\n";
    NSString* JSONStringRAW = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSRange rangeSubstrig = NSMakeRange(prefixMagic.length, JSONStringRAW.length - prefixMagic.length);
    JSONStringRAW = [JSONStringRAW substringWithRange:rangeSubstrig];
    return [JSONStringRAW dataUsingEncoding:NSUTF8StringEncoding];
}


#pragma mark -  SLLNetworkInputProtocol

- (void)startDownloadData:(NSArray<NSString *> *)listUrls
{
    if (listUrls.count == 0)
    {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSString *urlString in listUrls)
        {
            NSLog(@"URL = %@", urlString);
            self.sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
            self.urlSession = [NSURLSession sessionWithConfiguration:self.sessionConfiguration delegate:self delegateQueue:nil];
            self.sessionDownloadTask = [self.urlSession downloadTaskWithURL:[NSURL URLWithString:urlString]];
            [self.sessionDownloadTask resume];
        }
    });
}

- (void)startDownloadImage:(NSString *)url forTransferData:(id) transferData
{
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        if (!error) {
            [self.interactor finishLoadingSerialData:data forData:transferData];
        }
        else
            NSLog(@"error %@", error);
    }];
    
    [dataTask resume];
}


#pragma mark -  NSURLSessionDownloadDelegate

- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location
{
    NSString *url = [[[downloadTask currentRequest].URL absoluteString] stringByRemovingPercentEncoding];
    NSData *data = [self clearMagicSimbolsForRAWData:[NSData dataWithContentsOfURL:location]];
    NSError *errorSerialization;
    NSDictionary *jsonList = [NSJSONSerialization JSONObjectWithData:data  options: kNilOptions error: &errorSerialization];
    NSLog(@"json list = %@", jsonList);
    
    if (errorSerialization)
    {
        NSLog(@"Error = %@", errorSerialization);
        return;
    }
    
    if ([url containsString:[SLLNetworkCreateURL formatTypeToString:SLLNetworkRequestTypeAccount]])
    {
        [self.interactor finishLoadingParallelData:jsonList];
        return;
    }
    
    if ([url containsString:[SLLNetworkCreateURL formatTypeToString:SLLNetworkRequestTypeChange]])
    {
        [self.interactor finishLoadingData:jsonList];
        return;
    }
}

@end
