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
@property (nonatomic, strong) NSString *identifierCell;

@end


@implementation SLLChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self buildUI];
}

- (void) buildUI
{
    self.identifierCell = NSStringFromClass([SLLChangesTableViewCell class]);
    self.changesTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.changesTableView.delegate = self;
    self.changesTableView.dataSource = self;
    
    self.changesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.changesTableView.contentInset = UIEdgeInsetsMake(0, 0, 16, 0);
    self.changesTableView.showsVerticalScrollIndicator = NO;
    self.changesTableView.showsHorizontalScrollIndicator = NO;
    
    [self.changesTableView registerClass:[SLLChangesTableViewCell class] forCellReuseIdentifier:self.identifierCell];
    
    [self.view addSubview:self.changesTableView];
    
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return self.partiesArray.count
    return 20;
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
    // Получение начального фрейма перехода из ячейки
//    DAZPartyTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
//    CGRect cellFrame = [self.view convertRect:cell.cardView.bounds fromView:cell.cardView];
//
//    self.presentDetailsViewController = [[DAZPresentPartyDetailsTransitionController alloc] init];
//    self.presentDetailsViewController.cellFrame = cellFrame;
//
//    PartyMO *party = self.partiesArray[indexPath.row];
//    DAZPartyDetailsViewControllers *partyDetailsViewController = [[DAZPartyDetailsViewControllers alloc] initWithParty:party];
//    partyDetailsViewController.delegate = self;
//    partyDetailsViewController.transitioningDelegate = self;
    
//    [self presentViewController:partyDetailsViewController animated:YES completion:nil];
}

//- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
//{
//    return self.presentDetailsViewController;
//}

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


@end
