//
//  SLLChangesTableViewCell.m
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesTableViewCell.h"
#import "CAGradientLayer+SLLGradients.h"
#import "UILabel+SLLDesign.h"
#import "SLLChange.h"
#import "SLLAccount.h"

static const CGFloat SLLMarginsBorder = 5.0f;
static const CGFloat SLLHeightForConstraint = 20.0f;


@interface SLLChangesTableViewCell ()

@property (nonatomic, strong) UIView *frontView;
@property (nonatomic, strong) CAGradientLayer *frontLayer;
@property (nonatomic, strong) UILabel *numberChangesLabel;
@property (nonatomic, strong) UILabel *dateChangesLabel;
@property (nonatomic, strong) UILabel *repoChangesLabel;
@property (nonatomic, strong) UILabel *descriptionChangesLabel;

@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *authorLabel;

@end


@implementation SLLChangesTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        _frontView = [[UIView alloc] init];
        _frontView.layer.cornerRadius = 13;
        _frontView.layer.masksToBounds = YES;
        _frontView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_frontView];
        
        _frontLayer = [CAGradientLayer sll_linearGradientLayer];
        [_frontView.layer addSublayer:_frontLayer];
        
        // Номер изменения
        _numberChangesLabel = [UILabel sll_createLabelForView:_frontView];
        
        // Название репозитория
        _repoChangesLabel = [UILabel sll_createLabelForView:_frontView];
        
        // Дата и время обновления изменения
        _dateChangesLabel = [UILabel sll_createLabelForView:_frontView];
        
        // Описание изменения
        _descriptionChangesLabel = [UILabel sll_createLabelForView:_frontView];
        _descriptionChangesLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        _descriptionChangesLabel.numberOfLines = 2;
        
        // Аватарка пользователя
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImageView.backgroundColor = [UIColor whiteColor];
        _avatarImageView.layer.cornerRadius = 10;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.clipsToBounds = YES;
        [_frontView addSubview:_avatarImageView];
        
        // Имя пользователя
        _authorLabel = [UILabel sll_createLabelForView:_frontView];
        [self defaultValueDataForCell];
    }
    return self;
}

- (SLLChangesTableViewCell *)setCell:(SLLChangesTableViewCell *)cell ForData:(SLLChange *)changeData withOwner:(SLLAccount *)account
{
    cell.numberChangesLabel.text = [changeData.changeNumber stringValue];
    cell.repoChangesLabel.text = changeData.changeProject;
    cell.dateChangesLabel.text = changeData.changeUpdateDate;
    cell.descriptionChangesLabel.text = changeData.changeSubject;
    cell.authorLabel.text = account.name;
    cell.avatarImageView.image = [UIImage imageWithData:account.avatarImage];
    return cell;
}

- (void) defaultValueDataForCell
{
    self.numberChangesLabel.text = @"00000";
    self.repoChangesLabel.text = @"Repo";
    self.dateChangesLabel.text = @"01.01.2000";
    self.descriptionChangesLabel.text = @"Description";
    self.authorLabel.text = @"Unknown Unknown";
}

- (void)updateConstraints
{    
    self.frontView.translatesAutoresizingMaskIntoConstraints = NO;
    self.numberChangesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.repoChangesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.descriptionChangesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.dateChangesLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     @[
       [self.frontView.topAnchor constraintEqualToAnchor: self.contentView.topAnchor],
       [self.frontView.leftAnchor constraintEqualToAnchor: self.contentView.leftAnchor],
       [self.frontView.rightAnchor constraintEqualToAnchor: self.contentView.rightAnchor],
       [self.frontView.bottomAnchor constraintEqualToAnchor: self.contentView.bottomAnchor],
       
       [self.numberChangesLabel.topAnchor constraintEqualToAnchor: self.frontView.topAnchor constant:SLLMarginsBorder],
       [self.numberChangesLabel.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLMarginsBorder],
       [self.numberChangesLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor ],
       [self.numberChangesLabel.bottomAnchor constraintEqualToAnchor: self.descriptionChangesLabel.topAnchor],
       [self.numberChangesLabel.heightAnchor constraintEqualToConstant:SLLHeightForConstraint],
       
       [self.repoChangesLabel.topAnchor constraintEqualToAnchor: self.frontView.topAnchor constant:SLLMarginsBorder],
       [self.repoChangesLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor constant:-SLLMarginsBorder],
       
       [self.descriptionChangesLabel.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLMarginsBorder],
       [self.descriptionChangesLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor ],
       [self.descriptionChangesLabel.heightAnchor constraintGreaterThanOrEqualToConstant:SLLHeightForConstraint],
       
       [self.avatarImageView.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLMarginsBorder],
       [self.avatarImageView.widthAnchor constraintEqualToConstant:22.0],
       [self.avatarImageView.heightAnchor constraintEqualToConstant:22.0],
       [self.avatarImageView.bottomAnchor constraintEqualToAnchor: self.frontView.bottomAnchor constant:-SLLMarginsBorder],
       
       [self.authorLabel.leftAnchor constraintEqualToAnchor: self.avatarImageView.rightAnchor constant:SLLMarginsBorder],
       [self.authorLabel.bottomAnchor constraintEqualToAnchor: self.frontView.bottomAnchor constant:-7.0],
       
       [self.dateChangesLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor constant:-SLLMarginsBorder],
       [self.dateChangesLabel.bottomAnchor constraintEqualToAnchor: self.frontView.bottomAnchor constant:-7.0],
       ]];
    
    [super updateConstraints];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.frontLayer.frame = self.frontView.frame = self.contentView.bounds;
    [self updateConstraints];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    [self defaultValueDataForCell];
    [self updateConstraints];
}

@end
