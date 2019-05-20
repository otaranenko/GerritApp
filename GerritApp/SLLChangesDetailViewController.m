//
//  SLLChangesDetailViewController.m
//  GerritApp
//
//  Created by Oleg Taranenko on 08/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesDetailViewController.h"

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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.title = @"В разработке детали";
    [self buildUI];
}

- (void)buildUI
{
    self.centerView = [[UIView alloc] init];
    self.centerView.layer.masksToBounds = YES;
    self.centerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.centerView];
    
    // Дата и время обновления изменения
    self.numberLabel = [[UILabel alloc] init];
    self.numberLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    self.numberLabel.textColor = [UIColor whiteColor];
    [self.centerView addSubview:self.numberLabel];
    
    // Дата и время обновления изменения
    self.dateUpdateLabel = [[UILabel alloc] init];
    self.dateUpdateLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    self.dateUpdateLabel.textColor = [UIColor whiteColor];
    [self.centerView addSubview:self.dateUpdateLabel];
    
    // Дата и время обновления изменения
    self.dateCreateLabel = [[UILabel alloc] init];
    self.dateCreateLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    self.dateCreateLabel.textColor = [UIColor whiteColor];
    [self.centerView addSubview:self.dateCreateLabel];
    
    // Дата и время обновления изменения
    self.repoLabel = [[UILabel alloc] init];
    self.repoLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    self.repoLabel.textColor = [UIColor whiteColor];
    [self.centerView addSubview:self.repoLabel];
    
    // Дата и время обновления изменения
    self.descriptionLabel = [[UILabel alloc] init];
    self.descriptionLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    self.descriptionLabel.textColor = [UIColor whiteColor];
    [self.centerView addSubview:self.descriptionLabel];
    
    // Дата и время обновления изменения
    self.branchLabel = [[UILabel alloc] init];
    self.branchLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    self.branchLabel.textColor = [UIColor whiteColor];
    [self.centerView addSubview:self.branchLabel];
    
    // Дата и время обновления изменения
    self.topicLabel = [[UILabel alloc] init];
    self.topicLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    self.topicLabel.textColor = [UIColor whiteColor];
    [self.centerView addSubview:self.topicLabel];
}

@end
