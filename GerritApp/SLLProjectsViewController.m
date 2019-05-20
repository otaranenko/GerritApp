//
//  SLLProjectsViewController.m.m
//  GerritApp
//
//  Created by Oleg Taranenko on 23/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProjectsViewController.h"
#include "SLLProjectsTableViewCell.h"


@interface SLLProjectsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *projectsTableView;
@property (nonatomic, strong) NSString *identifierCell;
@property (nonatomic, strong) NSDictionary<NSString *, SLLProject *> *dataForCell;

@end


@implementation SLLProjectsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"Проекты";
    [self buildUI];
    [self setupRefreshControl];
    [self updateViewConstraints];
    [self actionRefreshParties];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([self.projectsTableView.refreshControl isRefreshing])
    {
        [self.projectsTableView.refreshControl endRefreshing];
    }
}

- (void)buildUI
{
    self.identifierCell = NSStringFromClass([SLLProjectsTableViewCell class]);
    self.projectsTableView = [[UITableView alloc] init];
    
    self.projectsTableView.delegate = self;
    self.projectsTableView.dataSource = self;
    
    self.projectsTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.projectsTableView.showsVerticalScrollIndicator = NO;
    self.projectsTableView.showsHorizontalScrollIndicator = NO;
    
    [self.projectsTableView registerClass:[SLLProjectsTableViewCell class] forCellReuseIdentifier:self.identifierCell];
    [self.view addSubview:self.projectsTableView];

}

- (void)setupRefreshControl
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Обновление"];
    [refreshControl addTarget:self action:@selector(actionRefreshParties) forControlEvents:UIControlEventValueChanged];
    self.projectsTableView.refreshControl = refreshControl;
}

- (void)updateViewConstraints
{
    self.projectsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:
     @[
       [self.projectsTableView.topAnchor constraintEqualToAnchor: self.view.topAnchor],
       [self.projectsTableView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor ],
       [self.projectsTableView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor ],
       [self.projectsTableView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor],
       ]];
    [super updateViewConstraints];
}

- (void)actionRefreshParties
{
    [self.projectsTableView.refreshControl beginRefreshing];
    [self.presenter getDataForProjectsList];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataForCell.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLLProjectsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifierCell forIndexPath:indexPath];
    
    if (!cell)
    {
        cell = [[SLLProjectsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.identifierCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    SLLProject *project = [self.dataForCell allValues][indexPath.row];
    cell = [cell setCell:cell ForData:project];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // [self.presenter showDetailViewControllerFor:self];
}

- (void)reloadTableView
{
    if (![self.projectsTableView.refreshControl isRefreshing])
    {
        [self.projectsTableView reloadData];
        return;
    }
    
    [self.projectsTableView performBatchUpdates:^{
        [self.projectsTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    } completion:^(BOOL finished) {
        if (finished)
        {
            [self.projectsTableView.refreshControl endRefreshing];
        }
    }];
}


#pragma mark -  SLLProjectsPresenterOutputProtocol

- (void)setTableViewForCellDataAccount:(NSDictionary<NSString *,SLLProject *> *)data
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.dataForCell = data;
        [self reloadTableView];
    });
}


@end
