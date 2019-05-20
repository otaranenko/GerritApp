//
//  SLLProjectsTableViewCell.m
//  GerritApp
//
//  Created by Oleg Taranenko on 20/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLProjectsTableViewCell.h"
#import "CAGradientLayer+SLLGradients.h"
#import "SLLProject.h"

static const CGFloat SLLmarginsBorder = 5.0f;


@interface SLLProjectsTableViewCell ()

@property (nonatomic, strong) UIView *frontView;
@property (nonatomic, strong) CAGradientLayer *frontLayer;

@property (nonatomic, strong) UILabel *nameProjectLabel;
@property (nonatomic, strong) UILabel *idStateLabel;
@property (nonatomic, strong) UILabel *webLinkURL;

@end



@implementation SLLProjectsTableViewCell

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
        
        // Название проекта
        _nameProjectLabel = [[UILabel alloc] init];
        _nameProjectLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
        _nameProjectLabel.textColor = [UIColor whiteColor];
        [_frontView addSubview:_nameProjectLabel];
        
        // Состояние проекта
        _idStateLabel = [[UILabel alloc] init];
        _idStateLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        _idStateLabel.textColor = [UIColor whiteColor];
        [_frontView addSubview:_idStateLabel];
        
        // Ссылка на Web-репозиторий для просмотра
        _webLinkURL = [[UILabel alloc] init];
        _webLinkURL.font = [UIFont systemFontOfSize:13 weight:UIFontWeightThin];
        _webLinkURL.textColor = [UIColor whiteColor];
        _webLinkURL.numberOfLines = 2;
        [_frontView addSubview:_webLinkURL];
        [self defaultValueDataForCell];
    }
    return self;
}


- (void) defaultValueDataForCell
{
    self.nameProjectLabel.text = @"Unknown";
    self.idStateLabel.text = @"Unknown";
    self.webLinkURL.text = @"Unknown";
}

- (SLLProjectsTableViewCell *)setCell:(SLLProjectsTableViewCell *)cell ForData:(SLLProject *)projectsData
{
    cell.nameProjectLabel.text = projectsData.nameProject;
    switch (projectsData.idState) {
        case SLLStateTypeReadOnly:
            cell.idStateLabel.text = @"Чтение";
            cell.idStateLabel.textColor = [UIColor yellowColor];
            break;
        case SLLStateTypeActive:
            cell.idStateLabel.text = @"Активный";
            cell.idStateLabel.textColor = [UIColor greenColor];
            break;
        case SLLStateTypeHidden:
            cell.idStateLabel.text = @"Спрятанный";
            cell.idStateLabel.textColor = [UIColor darkGrayColor];
            break;
        default:
            cell.idStateLabel.text = @"---";
            break;
    }
    cell.webLinkURL.text = projectsData.webLinkURL;
    return cell;
}

- (void)updateConstraints
{
    self.frontView.translatesAutoresizingMaskIntoConstraints = NO;
    self.nameProjectLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.idStateLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.webLinkURL.translatesAutoresizingMaskIntoConstraints = NO;
   
    [NSLayoutConstraint activateConstraints:
     @[
       [self.frontView.topAnchor constraintEqualToAnchor: self.contentView.topAnchor],
       [self.frontView.leftAnchor constraintEqualToAnchor: self.contentView.leftAnchor],
       [self.frontView.rightAnchor constraintEqualToAnchor: self.contentView.rightAnchor],
       [self.frontView.bottomAnchor constraintEqualToAnchor: self.contentView.bottomAnchor],
       
       [self.nameProjectLabel.topAnchor constraintEqualToAnchor: self.frontView.topAnchor constant:SLLmarginsBorder],
       [self.nameProjectLabel.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLmarginsBorder],
       [self.nameProjectLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor ],
       [self.nameProjectLabel.heightAnchor constraintEqualToConstant:20.0],
       
       [self.idStateLabel.topAnchor constraintEqualToAnchor: self.frontView.topAnchor constant:SLLmarginsBorder],
       [self.idStateLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor constant:-SLLmarginsBorder],
       [self.idStateLabel.heightAnchor constraintEqualToConstant:20.0],
       
       [self.webLinkURL.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLmarginsBorder],
       [self.webLinkURL.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor ],
       [self.webLinkURL.heightAnchor constraintGreaterThanOrEqualToConstant:22.0],
       [self.webLinkURL.bottomAnchor constraintEqualToAnchor: self.frontView.bottomAnchor constant:-SLLmarginsBorder],
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

