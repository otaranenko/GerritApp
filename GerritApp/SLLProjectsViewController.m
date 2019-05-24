//
//  SLLProjectsViewController.m.m
//  GerritApp
//
//  Created by Oleg Taranenko on 23/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProjectsViewController.h"
#import "SLLProjectsTableViewCell.h"
#import "UIRefreshControl+SLLDesign.m"
#import "SLLActivityIndicator.h"


@interface SLLProjectsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *projectsTableView;
@property (nonatomic, strong) NSString *identifierCell;
@property (nonatomic, strong) NSDictionary<NSString *, SLLProject *> *dataForCell;
@property (nonatomic, strong) SLLActivityIndicator *spinner;

@end


@implementation SLLProjectsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"Проекты";
    [self buildUI];
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
    
    // Устанавливаем Preload для  Pull-to-refresh
    self.projectsTableView.refreshControl = [UIRefreshControl sll_createRefreshControl:@selector(actionRefreshParties)];

    // Устанавливаем Preload
    self.spinner = [SLLActivityIndicator createActivityIndicatorForSubview:self.projectsTableView];
    [self.spinner startAnimating];
}

- (void)updateViewConstraints
{
    self.spinner.translatesAutoresizingMaskIntoConstraints = NO;
    self.projectsTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:
     @[
       [self.projectsTableView.topAnchor constraintEqualToAnchor: self.view.topAnchor],
       [self.projectsTableView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor ],
       [self.projectsTableView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor ],
       [self.projectsTableView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor],
       
       [self.spinner.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor],
       [self.spinner.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor],
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
    SLLProject *project = [self.dataForCell allValues][indexPath.row];
    [self.presenter showBrowserProject:project forView:self];
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
        [self.spinner stopAnimating];
        self.dataForCell = data;
        [self reloadTableView];
    });
}


@end
