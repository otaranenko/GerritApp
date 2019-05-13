//
//  SLLInternalData.h
//  GerritApp
//
//  Created by Oleg Taranenko on 12/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
@class NSManagedObject;


@protocol SLLInternalData <NSObject, NSCopying>

- (instancetype)initWithDictionary:(NSDictionary <NSString *, id> *)dictionary;

@optional
- (instancetype)initWithCoreData:(NSManagedObject *)object;

@end
