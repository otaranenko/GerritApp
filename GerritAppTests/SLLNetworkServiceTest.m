//
//  SLLNetworkServiceTest.m
//  GerritAppTests
//
//  Created by Oleg Taranenko on 15/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "SLLNetworkService.h"

@interface SLLNetworkService (Tests)

- (NSData *)clearMagicSimbolsForRAWData:(NSData *)data;
- (void)URLSession:(nonnull NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location;
@end


@interface SLLNetworkServiceTest : XCTestCase

@property (nonatomic, strong) SLLNetworkService *network;

@end


@implementation SLLNetworkServiceTest

- (void)setUp
{
    [super setUp];
    self.network = OCMPartialMock([SLLNetworkService new]);
}

- (void)tearDown
{
    self.network = nil;
    [super tearDown];
}

- (void)testClearMagicSimbolsForRAWData_DataNil
{
    NSData *dataInput = nil;
    
    NSData *data = [self.network clearMagicSimbolsForRAWData:dataInput];
    
    XCTAssertNil(data);
}

- (void)testClearMagicSimbolsForRAWData_DataNotMgigString
{
    NSString *stringInput = @"Banana Test";
    NSData *dataInput = [stringInput dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:true];

    NSData *dataResult = [self.network clearMagicSimbolsForRAWData:dataInput];
    
    NSString* dataResultString = [[NSString alloc] initWithData:dataResult encoding:NSUTF8StringEncoding];
    XCTAssertNotNil(dataResultString);
    XCTAssertTrue([dataResultString isEqualToString:stringInput]);
}

- (void)testClearMagicSimbolsForRAWData_DataContentMagicString
{
    NSString *stringInput = @")]}'\n[Banana Test]";
    NSData *dataInput = [stringInput dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:true];
    
    NSData *dataResult = [self.network clearMagicSimbolsForRAWData:dataInput];
    
    NSString* dataResultString = [[NSString alloc] initWithData:dataResult encoding:NSUTF8StringEncoding];
    XCTAssertNotNil(dataResultString);
    XCTAssertTrue([dataResultString isEqualToString:@"[Banana Test]"]);
}

- (void)testStartDownloadData_ListNil
{
    NSArray<NSString *> *dataInput = nil;
    
    BOOL result = [self.network startDownloadData:dataInput];
    
    XCTAssertEqual(result, NO);
}

- (void)testStartDownloadData_ListCountZero
{
    NSArray<NSString *> *dataInput = @[];
    
    BOOL result = [self.network startDownloadData:dataInput];
    
    XCTAssertEqual(result, NO);
}

- (void)testStartDownloadData_
{
//    BLOCK TESTING
//    NSArray<NSString *> *dataInput = @[];
//
//    BOOL result = [self.network startDownloadData:dataInput];
//
//    XCTAssertEqual(result, NO);
}

- (void)testStartDownloadImage_InputNil
{
    NSString *dataInput = nil;
    id<SLLInternalData> dataId = nil;
    
    BOOL result = [self.network startDownloadImage:dataInput forTransferData:dataId];
    
    XCTAssertEqual(result, NO);
}

- (void)testStartDownloadImage_InputNilString
{
    NSString *dataInput = nil;
    id<SLLInternalData> dataId = OCMProtocolMock(@protocol(SLLInternalData));
    
    BOOL result = [self.network startDownloadImage:dataInput forTransferData:dataId];
    
    XCTAssertEqual(result, NO);
}

- (void)testStartDownloadImage_InputNilId
{
    NSString *dataInput = @"Test";
    id<SLLInternalData> dataId = nil;
    
    BOOL result = [self.network startDownloadImage:dataInput forTransferData:dataId];
    
    XCTAssertEqual(result, NO);
}

- (void)testStartDownloadImage_
{
    NSString *dataInput = @"http://www.ru";
    id<SLLInternalData> dataId = OCMProtocolMock(@protocol(SLLInternalData));;
    id session = OCMClassMock([NSURLSession class]);
    id protocolInteractor = OCMProtocolMock(@protocol(SLLNetworkOutputProtocol));
    OCMStub([protocolInteractor finishLoadingSerialData:nil forData:nil]);
    
    BOOL result = [self.network startDownloadImage:dataInput forTransferData:dataId];
    
    OCMVerify(session);
    XCTAssertEqual(result, YES);
}


- (void)testURLSessionDownloadTaskDownloadTask_CaseErrorSerialization
{
    id session = OCMClassMock([NSURLSession class]);
    id downloadTask = OCMClassMock([NSURLSessionDownloadTask class]);
    id url = OCMClassMock([NSURL class]);
    
    NSString *stringInput = @"Banana Test";
    NSData *dataInput = [stringInput dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:true];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://test.ru"]];
    
    OCMStub([downloadTask currentRequest]).andReturn(request);
    OCMStub([self.network clearMagicSimbolsForRAWData:nil]).andReturn(dataInput);
    
    [self.network URLSession:session downloadTask:downloadTask didFinishDownloadingToURL:url];
    OCMReject([self.network.interactor finishLoadingParallelData:nil]);
    OCMReject([self.network.interactor finishLoadingData:nil]);
}

- (void)testURLSessionDownloadTaskDownloadTask_CaseNotValidURL
{
    id session = OCMClassMock([NSURLSession class]);
    id downloadTask = OCMClassMock([NSURLSessionDownloadTask class]);
    id url = OCMClassMock([NSURL class]);
    id protocolIterctor = OCMProtocolMock(@protocol(SLLNetworkOutputProtocol));
    self.network.interactor = protocolIterctor;
    NSDictionary <NSString *, NSString *> *dictionary = @{@"Test1":@"Value1",
                                                          @"Test2":@"Value2"
                                                          };
    NSData *dataInput = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://te7st.ru/acco4unts"]];
    
    OCMStub([downloadTask currentRequest]).andReturn(request);
    OCMStub([self.network clearMagicSimbolsForRAWData:nil]).andReturn(dataInput);
    [self.network URLSession:session downloadTask:downloadTask didFinishDownloadingToURL:url];
    
    OCMReject([self.network.interactor finishLoadingData:nil]);
    OCMReject([self.network.interactor finishLoadingParallelData:nil]);
}


- (void)testURLSessionDownloadTaskDownloadTask_CaseChanges
{
    id session = OCMClassMock([NSURLSession class]);
    id downloadTask = OCMClassMock([NSURLSessionDownloadTask class]);
    id url = OCMClassMock([NSURL class]);
    id protocolIterctor = OCMProtocolMock(@protocol(SLLNetworkOutputProtocol));
    self.network.interactor = protocolIterctor;
    NSDictionary <NSString *, NSString *> *dictionary = @{@"Test1":@"Value1",
                                                          @"Test2":@"Value2"
                                                          };
    NSData *dataInput = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://test.ru/changes"]];
    
    OCMStub([downloadTask currentRequest]).andReturn(request);
    OCMStub([self.network clearMagicSimbolsForRAWData:nil]).andReturn(dataInput);
    [self.network URLSession:session downloadTask:downloadTask didFinishDownloadingToURL:url];
    
    OCMReject([self.network.interactor finishLoadingParallelData:nil]);
    OCMVerify([self.network.interactor finishLoadingData:nil]);
}


- (void)testURLSessionDownloadTaskDownloadTask_CaseAccount
{
    id session = OCMClassMock([NSURLSession class]);
    id downloadTask = OCMClassMock([NSURLSessionDownloadTask class]);
    id url = OCMClassMock([NSURL class]);
    id protocolIterctor = OCMProtocolMock(@protocol(SLLNetworkOutputProtocol));
    self.network.interactor = protocolIterctor;
    NSDictionary <NSString *, NSString *> *dictionary = @{@"Test1":@"Value1",
                                                          @"Test2":@"Value2"
                                                          };
    NSData *dataInput = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://test.ru/accounts"]];
    
    OCMStub([downloadTask currentRequest]).andReturn(request);
    OCMStub([self.network clearMagicSimbolsForRAWData:nil]).andReturn(dataInput);
    [self.network URLSession:session downloadTask:downloadTask didFinishDownloadingToURL:url];
    
    OCMReject([self.network.interactor finishLoadingData:nil]);
    OCMVerify([self.network.interactor finishLoadingParallelData:nil]);
}

@end
