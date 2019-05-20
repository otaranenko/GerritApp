//
//  SLLAccountViewController.m
//  GerritApp
//
//  Created by Oleg Taranenko on 28/02/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountViewController.h"


@interface SLLAccountViewController ()

@property (nonatomic, strong) NSString *SLLGerritURLString;

@end


@implementation SLLAccountViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
        self.navigationItem.title = @"Настройки аккаунта";
}

- (void) createTableView
{

}


#pragma mark -  SLLAccountPresenterOutputProtocol

- (void)setTableViewForCellDataAccount:(NSDictionary<NSString *,id<SLLInternalData>> *)data {
    
}

@end
