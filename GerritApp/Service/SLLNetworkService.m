//
//  SLLNetworkService.m
//  GerritApp
//
//  Created by Oleg Taranenko on 12/03/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLNetworkService.h"
#import "SLLNetworkProtocol.h"
#import "SLLNetworkCreateURL.h"


@interface SLLNetworkService () <NSURLSessionDownloadDelegate>

@property(nonatomic,strong) NSURLSessionDownloadTask *sessionDownloadTask;
@property(nonatomic,strong) NSURLSessionConfiguration *sessionConfiguration;
@property(nonatomic,strong) NSURLSession *urlSession;

@end


@implementation SLLNetworkService

- (void)startConnection
{
    NSURL *url = [NSURL URLWithString:[SLLNetworkCreateURL infoChangeForOpen]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        if (!error && ![NSJSONSerialization isValidJSONObject:data])
        {
            NSData *clearJSONData = [self clearMagicSimbolsForRAWData:data];
            NSError *errorSerialization;
            NSDictionary *jsonList = [NSJSONSerialization JSONObjectWithData:clearJSONData  options: kNilOptions error: &errorSerialization];
            NSLog(@"json list = %@", jsonList);
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSDictionary *jsonList1 = [jsonList copy];
                NSMutableArray *arrayID = [NSMutableArray new];
                for (id key in jsonList1)
                {
                    NSNumber *ownerContainer = key[@"owner"][@"_account_id"];
                    [arrayID addObject:ownerContainer];
                }
                NSArray *uniqueArray = [[NSOrderedSet orderedSetWithArray:[arrayID copy]] array];
                NSLog(@"ID ++ == %@", uniqueArray);
                
              //  NSDictionary *idAccount = [jsonList[@"owner"] copy];
                NSLog(@"=====================");
              //  NSLog(@"json list = %@", idAccount);
                //   [self.view setBackgroundColor:[UIColor greenColor]];
            });
        }
        else
        {
            NSLog(@"error %@", error);
        }
    }];
    
    [dataTask resume];
}

- (NSData *)clearMagicSimbolsForRAWData:(NSData *)data
{
    NSString *prefixMagic = @")]}'\n";
    NSString* JSONStringRAW = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSRange rangeSubstrig = NSMakeRange(prefixMagic.length, JSONStringRAW.length - prefixMagic.length);
    JSONStringRAW = [JSONStringRAW substringWithRange:rangeSubstrig];
    return [JSONStringRAW dataUsingEncoding:NSUTF8StringEncoding];
}

- (void)parsingJSON:(NSDictionary *)jsonPhotos
{
    NSDictionary *photosContainer = jsonPhotos[@"photos"];
    NSDictionary *receivedPhotos = photosContainer[@"photo"];
}

- (void) startDownloadData:(NSArray<NSString *> *)listUrls
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


#pragma mark -  NSURLSessionDownloadDelegate

- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location
{
    NSData *data = [self clearMagicSimbolsForRAWData:[NSData dataWithContentsOfURL:location]];
    NSLog(@"Download Complition! %@", data);
    [self.interactor finishLoadingData:data];
}

@end
