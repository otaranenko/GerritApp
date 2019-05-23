//
//  SLLChangesTableViewCell.m
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesTableViewCell.h"
#import "CAGradientLayer+SLLGradients.h"
#import "SLLChange.h"
#import "SLLAccount.h"

static const CGFloat SLLmarginsBorder = 5.0f;


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
        _numberChangesLabel = [self createTemplateLabel];
        
        // Название репозитория
        _repoChangesLabel = [self createTemplateLabel];
        
        // Дата и время обновления изменения
        _dateChangesLabel = [self createTemplateLabel];
        
        // Описание изменения
        _descriptionChangesLabel = [self createTemplateLabel];
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
        _authorLabel = [self createTemplateLabel];
        [self defaultValueDataForCell];
    }
    return self;
}

- (UILabel *)createTemplateLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
    label.textColor = [UIColor whiteColor];
    [_frontView addSubview:label];
    return label;
}

- (SLLChangesTableViewCell *)setCell:(SLLChangesTableViewCell *)cell ForData:(SLLChange *)changeData
                           withOwner:(SLLAccount *)account
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
       
       [self.numberChangesLabel.topAnchor constraintEqualToAnchor: self.frontView.topAnchor constant:SLLmarginsBorder],
       [self.numberChangesLabel.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLmarginsBorder],
       [self.numberChangesLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor ],
       [self.numberChangesLabel.bottomAnchor constraintEqualToAnchor: self.descriptionChangesLabel.topAnchor],
       [self.numberChangesLabel.heightAnchor constraintEqualToConstant:20.0],
       
       [self.repoChangesLabel.topAnchor constraintEqualToAnchor: self.frontView.topAnchor constant:SLLmarginsBorder],
       [self.repoChangesLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor constant:-SLLmarginsBorder],
       
       [self.descriptionChangesLabel.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLmarginsBorder],
       [self.descriptionChangesLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor ],
       [self.descriptionChangesLabel.heightAnchor constraintGreaterThanOrEqualToConstant:20.0],
       
       [self.avatarImageView.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLmarginsBorder],
       [self.avatarImageView.widthAnchor constraintEqualToConstant:22.0],
       [self.avatarImageView.heightAnchor constraintEqualToConstant:22.0],
       [self.avatarImageView.bottomAnchor constraintEqualToAnchor: self.frontView.bottomAnchor constant:-SLLmarginsBorder],
       
       [self.authorLabel.leftAnchor constraintEqualToAnchor: self.avatarImageView.rightAnchor constant:SLLmarginsBorder],
       [self.authorLabel.bottomAnchor constraintEqualToAnchor: self.frontView.bottomAnchor constant:-7.0],
       
       [self.dateChangesLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor constant:-SLLmarginsBorder],
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
