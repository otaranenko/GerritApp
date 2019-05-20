//
//  SLLAccountInteractor.m
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountInteractor.h"

//https://accounts.google.com/o/oauth2/v2/auth?client_id=538366707668-tsm1h69748m691t02laoqkeit0uratpk.apps.googleusercontent.com&response_type=code&scope=https://www.googleapis.com/auth/gmail.send&redirect_uri=http://localhost&access_type=offline

@implementation SLLAccountInteractor


#pragma mark -  SLLNetworkOutputProtocol

- (void)finishLoadingData:(NSDictionary<NSString *,NSString *> *)rawData {
    
}

- (void)finishLoadingParallelData:(NSDictionary<NSString *,id> *)rawData {
    
}

- (void)finishLoadingSerialData:(NSData *)rawImage forData:(id)data {
    
}


#pragma mark -  SLLAccountItercatorInputProtocol

- (void)dataForProjects {
    
}

@end
