//
//  SLLNetworkCreateURLTest.m
//  GerritAppTests
//
//  Created by Oleg Taranenko on 15/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SLLNetworkCreateURL.h"

@interface SLLNetworkCreateURLTest : XCTestCase

@end

@implementation SLLNetworkCreateURLTest

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testInfoAccountFromId_NilNumber
{
    NSString *sourceString = nil;
    
    NSString *string = [SLLNetworkCreateURL infoAccountFromId:sourceString];
    
    XCTAssertNil(string);
}

- (void)testInfoAccountFromId_
{
    NSString *sourceString = @"123456789";
    
    NSString *string = [SLLNetworkCreateURL infoAccountFromId:sourceString];
    
    XCTAssertNotNil(string);
    XCTAssertTrue([string isEqualToString:@"https://gerrit-review.googlesource.com/accounts/123456789"]);
}

- (void)testInfoProject_
{
    NSString *string = [SLLNetworkCreateURL infoProject];
    
    XCTAssertNotNil(string);
    XCTAssertTrue([string isEqualToString:@"https://gerrit-review.googlesource.com/projects/"]);
}

- (void)testInfoChangeForParameters_ForOpen
{
    SLLNetworkRequestType formatType = SLLNetworkRequestTypeChangeForOpen;
    
    NSString *string = [SLLNetworkCreateURL infoChangeForParameters:formatType];
    
    XCTAssertNotNil(string);
    XCTAssertTrue([string isEqualToString:@"https://gerrit-review.googlesource.com/changes/?q=status:open"]);
}

- (void)testInfoChangeForParameters_ForMerge
{
    SLLNetworkRequestType formatType = SLLNetworkRequestTypeChangeForMerged;
    
    NSString *string = [SLLNetworkCreateURL infoChangeForParameters:formatType];
    
    XCTAssertNotNil(string);
    XCTAssertTrue([string isEqualToString:@"https://gerrit-review.googlesource.com/changes/?q=status:merged"]);
}


- (void)testFormatTypeToString_ExceptionNotValid
{
    SLLNetworkRequestType formatType = 666;
    
    XCTAssertThrows([SLLNetworkCreateURL formatTypeToString:formatType], @"Unknown type.");
}

- (void)testFormatTypeToString_Abandoned
{
    SLLNetworkRequestType formatType = SLLNetworkRequestTypeChangeForAbandoned;
    
    XCTAssertNoThrow([SLLNetworkCreateURL formatTypeToString:formatType], @"Unknown type.");
    NSString *string = [SLLNetworkCreateURL formatTypeToString:formatType];
    
    XCTAssertTrue([string isEqualToString:@"?q=status:abandoned"]);
}

- (void)testFormatTypeToString_Merged
{
    SLLNetworkRequestType formatType = SLLNetworkRequestTypeChangeForMerged;
    XCTAssertNoThrow([SLLNetworkCreateURL formatTypeToString:formatType], @"Unknown type.");
    NSString *string = [SLLNetworkCreateURL formatTypeToString:formatType];
    XCTAssertTrue([string isEqualToString:@"?q=status:merged"]);
}

- (void)testFormatTypeToString_ForAccount
{
    SLLNetworkRequestType formatType = SLLNetworkRequestTypeAccount;
    XCTAssertNoThrow([SLLNetworkCreateURL formatTypeToString:formatType], @"Unknown type.");
    NSString *string = [SLLNetworkCreateURL formatTypeToString:formatType];
    XCTAssertTrue([string isEqualToString:@"accounts"]);
}

@end
