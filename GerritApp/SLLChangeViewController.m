//
//  SLLChangeViewController.m
//  GerritApp
//
//  Created by Oleg Taranenko on 23/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangeViewController.h"
#import "SLLChangesTableViewCell.h"
#import "SLLChange.h"


@interface SLLChangeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *changesTableView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSString *identifierCell;
@property (nonatomic, strong) NSArray<SLLChange *> *dataChangeForCell;
@property (nonatomic, strong) NSDictionary<NSNumber *, SLLAccount *> *dataAccountForChange;

@end


@implementation SLLChangeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"Изменения";
    
    [self buildUI];
    [self setupRefreshControl];
    [self updateViewConstraints];
    [self actionRefreshParties];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([self.changesTableView.refreshControl isRefreshing])
    {
        [self.changesTableView.refreshControl endRefreshing];
    }
}

- (void)buildUI
{
    NSArray <NSString *> *itemSegmentedControl = @[@"Открытые", @"Объединенные", @"Отклоненные"];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:itemSegmentedControl];
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(actionSegmentChanged:) forControlEvents:UIControlEventValueChanged];
    self.segmentedControl.tintColor = [UIColor grayColor];
    self.navigationItem.titleView = self.segmentedControl;
    
    self.identifierCell = NSStringFromClass([SLLChangesTableViewCell class]);
    self.changesTableView = [[UITableView alloc] init];
    
    self.changesTableView.delegate = self;
    self.changesTableView.dataSource = self;
    
    self.changesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.changesTableView.showsVerticalScrollIndicator = NO;
    self.changesTableView.showsHorizontalScrollIndicator = NO;
    
    [self.changesTableView registerClass:[SLLChangesTableViewCell class] forCellReuseIdentifier:self.identifierCell];
    
    [self.view addSubview:self.changesTableView];
}

- (void)setupRefreshControl
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Обновление"];
    [refreshControl addTarget:self action:@selector(actionRefreshParties) forControlEvents:UIControlEventValueChanged];
    self.changesTableView.refreshControl = refreshControl;
}

- (void)updateViewConstraints
{
    self.changesTableView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:
     @[
       [self.changesTableView.topAnchor constraintEqualToAnchor: self.view.topAnchor],
       [self.changesTableView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor ],
       [self.changesTableView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor ],
       [self.changesTableView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor],
       ]];
    [super updateViewConstraints];
}


#pragma mark -  Action

- (void)actionForSelectionSegmentControl:(UISegmentedControl *)control
{
    NSInteger selectedSegment = control.selectedSegmentIndex;
    if (selectedSegment == 0)
    {
        [self.presenter getDataForChangesisOpen];
    }
    else if (selectedSegment == 1)
    {
        [self.presenter getDataForChangesisMerged];
    }
    else
    {
        [self.presenter getDataForChangesisAbandoned];
    }
}

- (void)actionRefreshParties
{
    [self.changesTableView.refreshControl beginRefreshing];
    [self actionForSelectionSegmentControl:self.segmentedControl];
}

- (void)actionSegmentChanged:(id)sender
{
    if ([sender isKindOfClass:[UISegmentedControl class]])
    {
        UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
        [self actionForSelectionSegmentControl:segmentedControl];
    }
    [self.changesTableView reloadData];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataChangeForCell.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLLChangesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifierCell forIndexPath:indexPath];

    if (!cell)
    {
        cell = [[SLLChangesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.identifierCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    SLLAccount *account = [self.dataAccountForChange objectForKey:self.dataChangeForCell[indexPath.row].changeOwnerAccountId];
    cell = [cell setCell:cell ForData:self.dataChangeForCell[indexPath.row] withOwner:account];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.presenter showDetailViewController];
}

- (void)reloadTableView
{
    if (![self.changesTableView.refreshControl isRefreshing])
    {
        [self.changesTableView reloadData];
        return;
    }
    
    [self.changesTableView performBatchUpdates:^{
        [self.changesTableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
    } completion:^(BOOL finished) {
        if (finished)
        {
            [self.changesTableView.refreshControl endRefreshing];
        }
    }];
}


#pragma mark -  SLLChangesPresenterOutputProtocol

- (void)setTableViewForCellData:(NSArray<SLLChange *> *)data
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.dataChangeForCell = data;
        [self reloadTableView];
    });
}

- (void)setTableViewForCellDataAccount:(NSDictionary<NSNumber *, SLLAccount *> *)data
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.dataAccountForChange = data;
        [self reloadTableView];
    });
}
@end
