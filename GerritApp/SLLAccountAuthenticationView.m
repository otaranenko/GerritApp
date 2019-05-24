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


static const CGFloat SLLmarginFoAuthenticationView = 30.f;

@interface SLLAccountAuthenticationView () <GIDSignInUIDelegate>

@property (nonatomic, strong) GIDSignInButton *signInButton;
@property (nonatomic, strong) UILabel *authenticationLabel;
@property (nonatomic, strong) UIButton *backView;

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
    
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.uiDelegate = self;
    [self updateConstraints];
}

- (void)updateConstraints
{
    self.authenticationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.signInButton.translatesAutoresizingMaskIntoConstraints = NO;
   
    [NSLayoutConstraint activateConstraints:
     @[
       [self.authenticationLabel.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor ],
       [self.authenticationLabel.centerYAnchor constraintEqualToAnchor: self.view.centerYAnchor constant:-SLLmarginFoAuthenticationView],
       [self.authenticationLabel.heightAnchor constraintEqualToConstant:20.0],
       [self.authenticationLabel.bottomAnchor constraintEqualToAnchor: self.signInButton.topAnchor constant:-SLLmarginFoAuthenticationView],
       
       [self.signInButton.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor ],
       [self.signInButton.rightAnchor constraintEqualToAnchor: self.view.rightAnchor constant:-SLLmarginFoAuthenticationView],
       [self.signInButton.leftAnchor constraintEqualToAnchor: self.view.leftAnchor constant:SLLmarginFoAuthenticationView],
       [self.signInButton.heightAnchor constraintEqualToConstant:20.0],
        ]];
}

@end
