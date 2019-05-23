//
//  SLLAccountAuthenticationView.m
//  GerritApp
//
//  Created by Oleg Taranenko on 21/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountAuthenticationView.h"
#import <GoogleSignIn/GIDSignInButton.h>
#import <GoogleSignIn/GoogleSignIn.h>


@interface SLLAccountAuthenticationView () <GIDSignInUIDelegate>

@property (nonatomic, strong) GIDSignInButton *signInButton;
@property (nonatomic, strong) UILabel *authenticationLabel;
@property (nonatomic, strong) UIButton *backView;
@property (nonatomic, strong) UILabel *authenticationInfoLabel;

@end


@implementation SLLAccountAuthenticationView

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self buildUI];
}

- (void)buildUI
{
    self.navigationItem.title = @"Авторизация";
    self.view.backgroundColor = [UIColor grayColor];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"noun_x" ] style:UIBarButtonItemStyleDone target:self.presenter action:@selector(dismissView)];
    leftButton.tintColor = [UIColor darkGrayColor];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    _authenticationLabel = [[UILabel alloc] init];
    _authenticationLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    _authenticationLabel.text = @"Пожалуйста авторизируйтесь....";
    _authenticationLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:_authenticationLabel];
    
    _signInButton = [GIDSignInButton new];
    _signInButton.frame = CGRectMake(100, 100, 100, 200);
    [self.view addSubview:_signInButton];
    
    _authenticationInfoLabel = [[UILabel alloc] init];
    _authenticationInfoLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    _authenticationInfoLabel.text = @"";
    _authenticationInfoLabel.textColor = [UIColor whiteColor];
    _authenticationInfoLabel.numberOfLines = 0;
    [self.view addSubview:_authenticationInfoLabel];
    
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.uiDelegate = self;
    [self updateConstraints];
}

- (void)updateConstraints
{
    self.authenticationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.signInButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.authenticationInfoLabel.translatesAutoresizingMaskIntoConstraints = NO;
   
    [NSLayoutConstraint activateConstraints:
     @[
       [self.authenticationLabel.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor ],
       [self.authenticationLabel.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor constant:-30],
       [self.authenticationLabel.heightAnchor constraintEqualToConstant:20.0],
       [self.authenticationLabel.bottomAnchor constraintEqualToAnchor: self.signInButton.topAnchor constant:-30],
       
       [self.signInButton.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor ],
       [self.signInButton.rightAnchor constraintEqualToAnchor: self.view.rightAnchor constant:-30],
       [self.signInButton.leftAnchor constraintEqualToAnchor: self.view.leftAnchor constant:30],
       [self.signInButton.heightAnchor constraintEqualToConstant:20.0],
       
       [self.authenticationInfoLabel.leftAnchor constraintEqualToAnchor: self.view.leftAnchor ],
       [self.authenticationInfoLabel.rightAnchor constraintEqualToAnchor: self.view.rightAnchor constant:-30],
       [self.authenticationInfoLabel.topAnchor constraintEqualToAnchor: self.signInButton.bottomAnchor],
        ]];
}

@end
