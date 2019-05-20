//
//  SLLProjectsInteractorProtocol.h
//  GerritApp
//
//  Created by Oleg Taranenko on 17/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProject.h"


@protocol SLLProjectsItercatorInputProtocol <NSObject>

- (void)dataForProjects;

@end


@protocol SLLProjectsIntercatorOutputProtocol <NSObject>

- (void)presentDataForDictionaryAccount:(NSDictionary<NSString *, SLLProject *> *)data;

@end
