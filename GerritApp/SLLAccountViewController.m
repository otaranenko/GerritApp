//
//  SLLAccountViewController.m
//  GerritApp
//
//  Created by Oleg Taranenko on 28/02/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountViewController.h"

static  const NSUInteger SLLsizeAvatarForView = 100;
static  const NSUInteger SLLmarginForView = 30;
static  const NSUInteger SLLsystemFontOfSize = 17;


@interface SLLAccountViewController () 

@property (nonatomic, strong) UIView *frontView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *authorEmailLabel;
@property (nonatomic, strong) UILabel *idAccountLabel;

@property (nonatomic, strong) UILabel *titleAuthorLabel;
@property (nonatomic, strong) UILabel *titleAuthorEmailLabel;
@property (nonatomic, strong) UILabel *titleIdAccountLabel;

@end


@implementation SLLAccountViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Информация";

    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"noun_exit"] style:UIBarButtonItemStyleDone target:self action:@selector(sigOutAccount)];
    rightButton.tintColor = [UIColor darkGrayColor];
    self.navigationItem.rightBarButtonItem = rightButton;
    [self buildUI];
    [self updateConstraints];
    [self.presenter stateAuthentication];
}

- (void)buildUI
{
    self.frontView = [[UIView alloc] init];
    self.frontView.layer.cornerRadius = 20;
    self.frontView.layer.masksToBounds = YES;
    self.frontView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.frontView];
    
    // Аватарка пользователя
    self.avatarImageView = [[UIImageView alloc] init];
    self.avatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.avatarImageView.backgroundColor = [UIColor grayColor];
    self.avatarImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.avatarImageView.layer.borderWidth = 1.0;
    self.avatarImageView.layer.cornerRadius = SLLsizeAvatarForView / 2;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.clipsToBounds = YES;
    [self.frontView addSubview:self.avatarImageView ];
    
    // Имя пользователя
    self.titleAuthorLabel = [self createTemplateLabel];
    self.titleAuthorLabel.text = @"Имя: ";
    self.authorLabel = [self createTemplateLabel];
    
    // Email пользователя
    self.titleAuthorEmailLabel = [self createTemplateLabel];
    self.titleAuthorEmailLabel.text = @"Email: ";
    self.authorEmailLabel = [self createTemplateLabel];
    
    // ID пользователя
    self.titleIdAccountLabel = [self createTemplateLabel];
    self.titleIdAccountLabel.text = @"ID: ";
    self.idAccountLabel = [self createTemplateLabel];
    
    [self defaultValueData];
}

/**
 Шаблон создания объектов типа LabeL
 
 @return возращает созданный и настроенный UILabel
 */
- (UILabel *)createTemplateLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:SLLsystemFontOfSize weight:UIFontWeightRegular];
    label.textColor = [UIColor whiteColor];
    label.numberOfLines = 1;
    [self.frontView addSubview:label];
    return label;
}

- (void)defaultValueData
{
    self.avatarImageView.image = [UIImage imageNamed:@"noun_avatar"];
    self.authorLabel.text = @"Нет данных";
    self.authorEmailLabel.text = @"Нет данных";
    self.idAccountLabel.text = @"Нет данных";
}

- (void)updateConstraints
{
    self.frontView.translatesAutoresizingMaskIntoConstraints = NO;
    self.avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.authorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.authorEmailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.idAccountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleAuthorLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleAuthorEmailLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleIdAccountLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat moveTopCoordinate = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    CGFloat scaleForRotation = self.navigationController.navigationBar.frame.size.width * 0.3  ;
    
    [NSLayoutConstraint activateConstraints:
     @[
       [self.frontView.topAnchor constraintEqualToAnchor: self.view.topAnchor constant:moveTopCoordinate],
       [self.frontView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor],
       [self.frontView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor],
       [self.frontView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor],
       
       [self.avatarImageView.topAnchor constraintEqualToAnchor: self.frontView.topAnchor constant:SLLmarginForView],
       [self.avatarImageView.centerXAnchor constraintEqualToAnchor: self.frontView.centerXAnchor ],
       [self.avatarImageView.widthAnchor constraintEqualToConstant:SLLsizeAvatarForView],
       [self.avatarImageView.heightAnchor constraintEqualToConstant:SLLsizeAvatarForView],
       
       [self.titleAuthorLabel.topAnchor constraintEqualToAnchor: self.avatarImageView.bottomAnchor ],
       [self.titleAuthorLabel.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLmarginForView],
       [self.titleAuthorLabel.rightAnchor constraintEqualToAnchor: self.authorEmailLabel.leftAnchor],
       [self.titleAuthorLabel.heightAnchor constraintEqualToConstant:SLLsizeAvatarForView/3],
       [self.titleAuthorLabel.widthAnchor constraintEqualToConstant:scaleForRotation],
       [self.titleAuthorLabel.bottomAnchor constraintEqualToAnchor: self.authorLabel.bottomAnchor],
       [self.authorLabel.topAnchor constraintEqualToAnchor: self.avatarImageView.bottomAnchor ],
       [self.authorLabel.leftAnchor constraintEqualToAnchor: self.titleAuthorLabel.rightAnchor],
       [self.authorLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor],
       [self.authorLabel.heightAnchor constraintEqualToConstant:SLLsizeAvatarForView/3],
       [self.authorLabel.bottomAnchor constraintEqualToAnchor: self.authorEmailLabel.topAnchor ],
       
       [self.titleAuthorEmailLabel.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLmarginForView],
       [self.titleAuthorEmailLabel.rightAnchor constraintEqualToAnchor: self.authorEmailLabel.leftAnchor],
       [self.titleAuthorEmailLabel.heightAnchor constraintEqualToConstant:SLLsizeAvatarForView/3],
       [self.titleAuthorEmailLabel.bottomAnchor constraintEqualToAnchor: self.authorEmailLabel.bottomAnchor],
       [self.authorEmailLabel.leftAnchor constraintEqualToAnchor: self.titleAuthorEmailLabel.rightAnchor],
       [self.authorEmailLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor],
       [self.authorEmailLabel.heightAnchor constraintEqualToConstant:SLLsizeAvatarForView/3],
       [self.authorEmailLabel.bottomAnchor constraintEqualToAnchor: self.idAccountLabel.topAnchor],

       [self.titleIdAccountLabel.leftAnchor constraintEqualToAnchor: self.frontView.leftAnchor constant:SLLmarginForView],
       [self.titleIdAccountLabel.rightAnchor constraintEqualToAnchor: self.authorEmailLabel.leftAnchor],
       [self.titleIdAccountLabel.heightAnchor constraintEqualToConstant:SLLsizeAvatarForView/3],
       [self.titleIdAccountLabel.bottomAnchor constraintEqualToAnchor: self.idAccountLabel.bottomAnchor],
       [self.idAccountLabel.leftAnchor constraintEqualToAnchor: self.titleIdAccountLabel.rightAnchor],
       [self.idAccountLabel.rightAnchor constraintEqualToAnchor: self.frontView.rightAnchor],
       [self.idAccountLabel.heightAnchor constraintEqualToConstant:SLLsizeAvatarForView/3],
       ]];
    
    [super updateViewConstraints];
}

- (void)sigOutAccount
{
    [self.presenter sigOutAccount];
}


#pragma mark -  SLLAccountPresenterOutputProtocol

- (void)setDataAccount:(SLLAccount *)data
{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.authorLabel.text = data.name;
        self.authorEmailLabel.text = data.email;
        self.idAccountLabel.text = data.account_id.stringValue;
        self.avatarImageView.image = [UIImage imageWithData:data.avatarImage];
    });
}

- (void)setStatusAuthenticationStatus:(BOOL)status
{
    if (!status)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self defaultValueData];
            [self.presenter presentView];
        });
        return;
    }
    [self.presenter dismissView];
}
@end
