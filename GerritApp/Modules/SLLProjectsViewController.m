//
//  SLLProjectsViewController.m.m
//  GerritApp
//
//  Created by Oleg Taranenko on 23/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProjectsViewController.h"


@interface SLLProjectsViewController ()

@end


@implementation SLLProjectsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"Проекты";
    [self buildUI];
}

- (void)buildUI
{
    [self.presenter getDataForProjectsList];
}


#pragma mark -  SLLProjectsPresenterOutputProtocol

- (void)setTableViewForCellData:(NSArray<id<SLLInternalData> > *)data
{
    
}

@end
