//
//  SLLChangesTableViewCell.m
//  GerritApp
//
//  Created by Oleg Taranenko on 06/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLChangesTableViewCell.h"
#import "CAGradientLayer+SLLGradients.h"


static const CGFloat SLLmarginsBorder = 5.0f;


@interface SLLChangesTableViewCell ()

@property (nonatomic, strong) UIView *frontView;
@property (nonatomic, strong) CAGradientLayer *frontLayer;

//@property (nonatomic, strong) UIImageView *favoritsChangesImageView;
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
        _frontView.layer.cornerRadius = 14;
        _frontView.layer.masksToBounds = YES;
        _frontView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_frontView];
        
        _frontLayer = [CAGradientLayer sll_linearGradientLayer];
        [_frontView.layer addSublayer:_frontLayer];
        
        // Номер изменения
        _numberChangesLabel = [[UILabel alloc] init];
        _numberChangesLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        _numberChangesLabel.textColor = [UIColor whiteColor];
        [_frontView addSubview:_numberChangesLabel];
        
        // Название репозитория
        _repoChangesLabel = [[UILabel alloc] init];
        _repoChangesLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        _repoChangesLabel.textColor = [UIColor whiteColor];
        [_frontView addSubview:_repoChangesLabel];
        
        // Дата и время обновления изменения
        _dateChangesLabel = [[UILabel alloc] init];
        _dateChangesLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        _dateChangesLabel.textColor = [UIColor whiteColor];
        [_frontView addSubview:_dateChangesLabel];
        
        // Описание изменения
        _descriptionChangesLabel = [[UILabel alloc] init];
        _descriptionChangesLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        _descriptionChangesLabel.textColor = [UIColor whiteColor];
        [_frontView addSubview:_descriptionChangesLabel];
        
        // Аватарка пользователя
        _avatarImageView = [[UIImageView alloc] init];
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avatarImageView.backgroundColor = [UIColor redColor];
        _avatarImageView.layer.cornerRadius = 10;
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.clipsToBounds = YES;
        [_frontView addSubview:_avatarImageView];
        
        // Имя пользователя
        _authorLabel = [[UILabel alloc] init];
        _authorLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        _authorLabel.textColor = [UIColor whiteColor];
        [_frontView addSubview:_authorLabel];
        [self defaultValueUI];
        [self updateConstraints];
    }
    return self;
}

- (void) defaultValueUI
{
    _numberChangesLabel.text = @"00000";
    _repoChangesLabel.text = @"Repo";
    _dateChangesLabel.text = @"01.01.2000";
    _descriptionChangesLabel.text = @"Description";
    _authorLabel.text = @"Unknown Unknown";
}

- (void)updateConstraints {

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
       [self.frontView.leftAnchor constraintEqualToAnchor: self.contentView.leftAnchor constant:SLLmarginsBorder],
       [self.frontView.rightAnchor constraintEqualToAnchor: self.contentView.rightAnchor constant:-SLLmarginsBorder],
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
       [self.descriptionChangesLabel.heightAnchor constraintEqualToConstant:20.0],
       
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
}


- (void)prepareForReuse
{
    [super prepareForReuse];
    [self defaultValueUI];
}

@end
