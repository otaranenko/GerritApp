//
//  SLLCoreDataService.m
//  GerritAppTests
//
//  Created by Oleg Taranenko on 26/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "../GerritApp/SLLCoreDataService.h"


@interface SLLCoreDataService (Tests)

//+ (NSPersistentContainer *)persistentContainer;
//+ (NSManagedObjectContext *)coreDataContext;
- (void)saveContext;
- (void)deleteObjects:(NSArray<NSManagedObject *> *)objects;

@end


@interface SLLCoreDataServiceTest : XCTestCase

@property (nonatomic, strong) SLLCoreDataService *coreData;

@end


@implementation SLLCoreDataServiceTest

- (void)setUp
{
    [super setUp];
   // self.coreData = OCMPartialMock([SLLCoreDataService new]);
}

- (void)tearDown
{
    self.coreData = nil;
    [super tearDown];
}


//- (void)testPersistentContainer_ContainerCreate
//{
//    SLLCoreDataService.persistentContainer = OCMClassMock([NSPersistentContainer class]);
//
//    NSPersistentContainer *result = [SLLCoreDataService persistentContainer];
//
//    XCTAssertEqual(SLLCoreDataService.persistentContainer, result);
//}

//+ (NSPersistentContainer *)persistentContainer
//{
//    static NSPersistentContainer *_persistentContainer;
//
//    if (_persistentContainer == nil)
//    {
//        _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"GerritApp"];
//        [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error)
//         {
//             if (error != nil)
//             {
//                 NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//                 abort();
//             }
//         }];
//    }
//    return _persistentContainer;
//}

- (void)testSaveContext_error
{
    id coreData = OCMClassMock([SLLCoreDataService class]);
    id cont = OCMClassMock([NSPersistentContainer class]);
    OCMStub([coreData persistentContainer]).andReturn(cont);
    
    id context = OCMClassMock([NSManagedObjectContext class]);
    OCMStub([coreData coreDataContext]).andReturn(context);
    OCMStub([context hasChanges]).andReturn(NO);
    NSError *error = nil;
    OCMStub([context save:&error]).andReturn(YES);
    
   [ [SLLCoreDataService new] saveContext];
    
    OCMVerify(error.userInfo);
}

//- (void)testSaveContext_NotError
//{
//    id context = OCMPartialMock([NSManagedObjectContext class]);
//    OCMStub([context coreDataContext]);
//    OCMStub([context hasChanges]).andReturn(NO);
//    NSError *error = nil;
//    OCMStub([context save:&error]).andReturn(NO);
//
//    [self.coreData saveContext];
//
//    OCMVerify(error.userInfo);
//}
//- (void)saveContext
//{
//    NSManagedObjectContext *context = [self coreDataContext];
//
//    NSError *error = nil;
//    if ([context hasChanges] && ![context save:&error])
//    {
//        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//        abort();
//    }
//}
//
//- (void)deleteObjects:(NSArray<NSManagedObject *> *)objects
//{
//    for (id object in objects)
//    {
//        [self.coreDataContext deleteObject:object];
//    }
//    [self saveContext];
//}
@end
