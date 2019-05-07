//
//  SLLChangeViewController.m
//  GerritApp
//
//  Created by Oleg Taranenko on 23/04/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangeViewController.h"
#import "SLLChangesTableViewCell.h"


@interface SLLChangeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *changesTableView;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) NSString *identifierCell;
@property (nonatomic, strong) NSArray <NSString *> *dataForCell;

@end


@implementation SLLChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"Изменения";
    
    [self buildUI];
    [self setupRefreshControl];
    [self updateViewConstraints];
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
    [refreshControl addTarget:self action:@selector(actionRefreshParties:) forControlEvents:UIControlEventValueChanged];
    self.changesTableView.refreshControl = refreshControl;
}

- (void)actionRefreshParties:(id)sender
{
    if ([sender isKindOfClass:[UIRefreshControl class]])
    {
        [self.changesTableView.refreshControl beginRefreshing];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"START UPDATE to INTERACOR TIMER !!!");
              [self.presenter getDataForChangesisOpen];
        });
    }
    else
    {
        [self.presenter getDataForChangesisOpen];
        NSLog(@"Start UPDATE INTERACOR");
    }
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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   // return self.dataForCell.count;
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLLChangesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.identifierCell forIndexPath:indexPath];

    if (!cell) {
        cell = [[SLLChangesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.identifierCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"ffdfdfdfd");
//    [self presentViewController:detailsViewController animated:YES completion:nil];
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


- (void)setTableViewForCellData:(NSArray<NSString *> *)data {
    self.dataForCell = data;
    [self reloadTableView];
}

@end
