//
//  SLLChangePresenter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangePresenter.h"

@implementation SLLChangePresenter


#pragma mark -  SLLChangePresenterInputProtocol

- (void)getDataForChangesisAbandoned {
        NSLog(@"getDataForChangesisAbandoned");
}

- (void)getDataForChangesisMerged {
    NSLog(@"getDataForChangesisMerged");
}

- (void)getDataForChangesisOpen {
    [self.interactor dataForChangesisOpen];
}


#pragma mark -  SLLItercatorOutupProtocol

- (void)getChangeGerritForPresenter
{
    
}

@end
