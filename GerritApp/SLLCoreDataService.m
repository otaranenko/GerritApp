//
//  SLLCoreDataService.m
//  GerritApp
//
//  Created by Oleg Taranenko on 13/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLCoreDataService.h"
#import "SLLAccountCoreData+CoreDataClass.h"
#import "SLLAccount.h"


@interface SLLCoreDataService ()

@property (nonatomic, weak, nullable) NSManagedObjectContext *coreDataContext;

@end


@implementation SLLCoreDataService

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _coreDataContext = [[self class] coreDataContext];
    }
    return self;
}

#pragma mark - Core Data stack

+ (NSPersistentContainer *)persistentContainer
{
    static NSPersistentContainer *_persistentContainer;
    
    if (!_persistentContainer)
    {
        _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"GerritApp"];
        [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error)
         {
             if (error)
             {
                 NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                 abort();
             }
         }];
    }
    return _persistentContainer;
}

+ (NSManagedObjectContext *)coreDataContext
{
    return self.persistentContainer.viewContext;
}


#pragma mark - Core Data Delete / Save support

- (void)saveContext
{
    NSManagedObjectContext *context = [self coreDataContext];
    
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

- (void)deleteObjects:(NSArray<NSManagedObject *> *)objects
{
    for (id object in objects)
    {
        [self.coreDataContext deleteObject:object];
    }
    [self saveContext];
}

- (NSArray *)getDataForFetchRequest:(NSFetchRequest *)fetchRequest
{
    NSError *error;
    NSArray<SLLAccountCoreData *> *results = [self.coreDataContext executeFetchRequest:fetchRequest error:&error];
    
    if (!results)
    {
        NSLog(@"Fetching error: %@", error);
        return nil;
    }
    return results;
}


#pragma mark -  SLLCoreDataInputProtocol

- (NSDictionary<NSNumber *, SLLAccount*> *)getDataForCoreData
{
    NSArray *results = [self getDataForFetchRequest:[SLLAccountCoreData fetchRequestForAccountId]];
    NSMutableDictionary<NSNumber *, SLLAccount*> *arrayResult = [NSMutableDictionary new];
    for (SLLAccountCoreData *accountCoreData in results)
    {
        [arrayResult setObject:[[SLLAccount alloc] initWithCoreData:accountCoreData] forKey:accountCoreData.idAccount];
    }

    return [arrayResult copy];
}

- (BOOL)setDataForCoreData:(id<SLLInternalData>)data
{
    if (![data isKindOfClass:[SLLAccount class]])
    {
        return NO;
    }
    SLLAccountCoreData *account = [SLLAccountCoreData accountCoreDataWithContext:self.coreDataContext internalData:data];
    if (!account)
    {
        return NO;
    }
    
    [self saveContext];
    return YES;
}

@end

