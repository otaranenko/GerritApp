//
//  SLLChangesPresenter.m
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesPresenter.h"


@interface SLLChangesPresenter ()

@property (nonatomic, strong) NSArray<SLLChange *> *change;
@property (nonatomic, strong) NSDictionary<NSNumber *, SLLAccount *> *account;

@end

@implementation SLLChangesPresenter

- (instancetype)init
{
    self = [super init];
    if (self) {
        _change = [NSArray new];
        _account = [NSDictionary new];
    }
    return self;
}


#pragma mark -  SLLChangesPresenterInputProtocol

- (void)getDataForChangesisAbandoned
{
    [self.interactor dataForChangesisAbandoned];
}

- (void)getDataForChangesisMerged
{
    [self.interactor dataForChangesisMerged];
}

- (void)getDataForChangesisOpen
{
    [self.interactor dataForChangesisOpen];
}

- (void)showDetailViewControllerFor:(id)viewController
{
    [self.router presentDetailViewController:viewController];
}


#pragma mark -  SLLItercatorOutupProtocol

- (void)getChangeGerritForPresenter
{
    
}

- (void)presentDataForChange:(NSArray<SLLChange *> *)data
{
    for (SLLChange *change in data)
    {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSS";
        NSDate *updatedate = [formatter dateFromString:change.changeUpdateDate];
        [formatter setDateFormat:@"HH:mm dd/MM/yyyy"];
        change.changeUpdateDate = [formatter stringFromDate:updatedate];
    }
    self.change = [data copy];
    [self.view setTableViewForCellData:data];
}

- (void)presentDataForAccount:(SLLAccount *)data
{
    NSMutableDictionary<NSNumber *, SLLAccount *> *array = [self.account mutableCopy];
    [array setObject:data forKey:data.account_id];
    self.account = [array copy];
    [self.view setTableViewForCellDataAccount:self.account];
}

@end
