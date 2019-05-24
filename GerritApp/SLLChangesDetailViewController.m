//
//  SLLChangesDetailViewController.m
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesDetailViewController.h"
#import "UILabel+SLLDesign.h"

@interface SLLChangesDetailViewController ()

@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UIView *centerView;
@property (nonatomic, strong) UIView *footerView;

@property (nonatomic, strong) UILabel *numberLabel;
@property (nonatomic, strong) UILabel *dateUpdateLabel;
@property (nonatomic, strong) UILabel *dateCreateLabel;
@property (nonatomic, strong) UILabel *repoLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *branchLabel;
@property (nonatomic, strong) UILabel *topicLabel;

@property (nonatomic, strong) UIImageView *ownerAvatarImageView;
@property (nonatomic, strong) UILabel *ownerAuthorLabel;
@property (nonatomic, strong) UILabel *ownerEmailLabel;

@end

@implementation SLLChangesDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"Детали в разработке!";
    [self buildUI];
}

- (void)buildUI
{
    self.centerView = [[UIView alloc] init];
    self.centerView.layer.masksToBounds = YES;
    self.centerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.centerView];
    
    // Дата и время обновления изменения
    self.numberLabel = [UILabel sll_createLabelForView:self.centerView];
    
    // Дата и время обновления изменения
    self.dateUpdateLabel = [UILabel sll_createLabelForView:self.centerView];
    
    // Дата и время обновления изменения
    self.dateCreateLabel = [UILabel sll_createLabelForView:self.centerView];
    
    // Дата и время обновления изменения
    self.repoLabel = [UILabel sll_createLabelForView:self.centerView];
    
    // Дата и время обновления изменения
    self.descriptionLabel = [UILabel sll_createLabelForView:self.centerView];
    
    // Дата и время обновления изменения
    self.branchLabel = [UILabel sll_createLabelForView:self.centerView];
    
    // Дата и время обновления изменения
    self.topicLabel = [UILabel sll_createLabelForView:self.centerView];
}


@end
