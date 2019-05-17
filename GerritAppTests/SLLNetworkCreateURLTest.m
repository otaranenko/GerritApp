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

- (void)testCreateURLFromAccountId_NilNumber
{
    NSString *sourceString = nil;
    
    NSString *string = [SLLNetworkCreateURL createURLFromAccountId:sourceString];
    
    XCTAssertNil(string);
}

- (void)testCreateURLFromAccountId_
{
    NSString *sourceString = @"123456789";
    
    NSString *string = [SLLNetworkCreateURL createURLFromAccountId:sourceString];
    
    XCTAssertNotNil(string);
    XCTAssertTrue([string isEqualToString:@"https://gerrit-review.googlesource.com/accounts/123456789"]);
}

- (void)testCreateURLFromOneLevelTypeAndTwoLevelType_ForOpen
{
    SLLRequestLeveLType oneFormatType = SLLRequestTypeChange;
    SLLRequestLeveLType twoFormatType = SLLRequestTypeChangeForOpen;
    
    NSString *string = [SLLNetworkCreateURL createURLFromOneLevelType:oneFormatType andTwoLevelType:twoFormatType];
    
    XCTAssertNotNil(string);
    XCTAssertTrue([string isEqualToString:@"https://gerrit-review.googlesource.com/changes/?q=status:open"]);
}

- (void)testCreateURLFromOneLevelTypeAndTwoLevelType_ForMerge
{
    SLLRequestLeveLType oneFormatType = SLLRequestTypeChange;
    SLLRequestLeveLType twoFormatType = SLLRequestTypeChangeForMerged;
    
    NSString *string = [SLLNetworkCreateURL createURLFromOneLevelType:oneFormatType andTwoLevelType:twoFormatType];
    
    XCTAssertNotNil(string);
    XCTAssertTrue([string isEqualToString:@"https://gerrit-review.googlesource.com/changes/?q=status:merged"]);
}

- (void)testCreateURLFromOneLevelType_
{
    SLLRequestLeveLType oneFormatType = SLLRequestTypeProject;
    
    NSString *string = [SLLNetworkCreateURL createURLFromOneLevelType:oneFormatType];
    
    XCTAssertNotNil(string);
    XCTAssertTrue([string isEqualToString:@"https://gerrit-review.googlesource.com/projects/"]);
}


- (void)testFormatTypeToString_ExceptionNotValid
{
    SLLRequestLeveLType formatType = 666;
    
    XCTAssertThrows([SLLNetworkCreateURL formatTypeToString:formatType], @"Unknown type.");
}

- (void)testFormatTypeToString_Abandoned
{
    SLLRequestLeveLType formatType = SLLRequestTypeChangeForAbandoned;
    
    XCTAssertNoThrow([SLLNetworkCreateURL formatTypeToString:formatType], @"Unknown type.");
    NSString *string = [SLLNetworkCreateURL formatTypeToString:formatType];
    
    XCTAssertTrue([string isEqualToString:@"?q=status:abandoned"]);
}

- (void)testFormatTypeToString_Merged
{
    SLLRequestLeveLType formatType = SLLRequestTypeChangeForMerged;
    XCTAssertNoThrow([SLLNetworkCreateURL formatTypeToString:formatType], @"Unknown type.");
    NSString *string = [SLLNetworkCreateURL formatTypeToString:formatType];
    XCTAssertTrue([string isEqualToString:@"?q=status:merged"]);
}

- (void)testFormatTypeToString_ForAccount
{
    SLLRequestLeveLType formatType = SLLRequestTypeAccount;
    XCTAssertNoThrow([SLLNetworkCreateURL formatTypeToString:formatType], @"Unknown type.");
    NSString *string = [SLLNetworkCreateURL formatTypeToString:formatType];
    XCTAssertTrue([string isEqualToString:@"accounts"]);
}

@end
