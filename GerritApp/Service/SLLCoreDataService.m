//
//  SLLCoreDataService.m
//  GerritApp
//
//  Created by Oleg Taranenko on 13/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLCoreDataService.h"


@interface SLLCoreDataService ()

//@property (nonatomic, weak, nullable) NSManagedObjectContext *coreDataContext;

@end


@implementation SLLCoreDataService


#pragma mark - Core Data stack

- (NSPersistentContainer *)persistentContainer
{
    static NSPersistentContainer *_persistentContainer;
    
    if (_persistentContainer == nil)
    {
        _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"GerritApp"];
        [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error)
         {
             if (error != nil)
             {
                 NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                 abort();
             }
         }];
    }
    
    return _persistentContainer;
}

- (NSManagedObjectContext *)coreDataContext
{
    NSPersistentContainer *container = self.persistentContainer;
    return container.viewContext;
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


#pragma mark -  SLLCoreDataInputProtocol

- (void)getDataForCoreData:(NSString *)data {
    NSLog(@"IS IMPL");
}

- (void)setDataForCoreData:(NSString *)data {
    NSLog(@"IS IMPL");
}

@end

