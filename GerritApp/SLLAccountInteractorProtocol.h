//
//  SLLAccountInteractorProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//
#import "SLLInternalData.h"


@protocol SLLAccountIntercatorInputProtocol <NSObject>

- (void)dataForProjects;

@end


@protocol SLLAccountIntercatorOutputProtocol <NSObject>

- (void)presentDataForDictionarySelfAccount:(NSDictionary<NSString *, id<SLLInternalData> > *)data;

@end
