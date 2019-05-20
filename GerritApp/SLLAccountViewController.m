//
//  SLLAccountViewController.m
//  GerritApp
//
//  Created by Oleg Taranenko on 28/02/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLAccountViewController.h"
#import <GoogleSignIn/GoogleSignIn.h>


@interface SLLAccountViewController () <GIDSignInDelegate, GIDSignInUIDelegate>

@property (nonatomic, strong) NSString *SLLGerritURLString;

@end


@implementation SLLAccountViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
        self.navigationItem.title = @"Настройки аккаунта";
    GIDSignInButton *signInButton = [GIDSignInButton new];
    signInButton.frame = CGRectMake(100, 100, 100, 200);
    [self.view addSubview:signInButton];
    [self createAuth];
  //  [self reportAuthStatus];
    
}
- (void)viewWillAppear:(BOOL)animated {
   
    [self reportAuthStatus];
    [super viewWillAppear:animated];
}

- (void) createAuth
{
    GIDSignIn *signIn = [GIDSignIn sharedInstance];
    signIn.shouldFetchBasicProfile = YES;
    signIn.delegate = self;
    signIn.uiDelegate = self;
    signIn.clientID = @"314133874140-ptcg59nt6loq7655s7jl7agheu9pm0po.apps.googleusercontent.com";
  //  [signIn signInSilently ];
 //   [GIDSignIn sharedInstance].signInSilently;
}


#pragma mark -  SLLAccountPresenterOutputProtocol

- (void)setTableViewForCellDataAccount:(NSDictionary<NSString *,id<SLLInternalData>> *)data
{
    
}


#pragma mark -  GIDSignInDelegate

- (void)signIn:(GIDSignIn *)signIn didSignInForUser:(GIDGoogleUser *)user withError:(NSError *)error
{
    if (error)
    {
        NSLog(@"SSSSSSSSS");
      //  _signInAuthStatus.text = [NSString stringWithFormat:@"Status: Authentication error: %@", error];
        return;
    }
    [self reportAuthStatus];
//    [self updateButtons];
}


- (void)reportAuthStatus
{
    GIDGoogleUser *googleUser = [[GIDSignIn sharedInstance] currentUser];
    if (googleUser.authentication)
    {
        NSLog(@"Authenticated");
//        _signInAuthStatus.text = @"Status: Authenticated";
    }
    else
    {
         NSLog(@"Not Authenticated");
        // To authenticate, use Google+ sign-in button.
       // _signInAuthStatus.text = @"Status: Not authenticated";
    }
    
    [self refreshUserInfo];
}


- (void)refreshUserInfo {
    if ([GIDSignIn sharedInstance].currentUser.authentication == nil) {
       // kPlaceholderUserName;
//        self.userName.text = kPlaceholderUserName;
//        self.userEmailAddress.text = kPlaceholderEmailAddress;
//        self.userAvatar.image = [UIImage imageNamed:kPlaceholderAvatarImageName];
        return;
    }
  //   [GIDSignIn sharedInstance].currentUser.profile.email;
 //   [GIDSignIn sharedInstance].currentUser.profile.name;
    
 //   [GIDSignIn sharedInstance].currentUser.profile.hasImage;
//    self.userEmailAddress.text = [GIDSignIn sharedInstance].currentUser.profile.email;
//    self.userName.text = [GIDSignIn sharedInstance].currentUser.profile.name;
//
    if (![GIDSignIn sharedInstance].currentUser.profile.hasImage) {
        // There is no Profile Image to be loaded.
        return;
    }
    // Load avatar image asynchronously, in background
    dispatch_queue_t backgroundQueue =
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    __weak SignInViewController *weakSelf = self;
    
//    dispatch_async(backgroundQueue, ^{
//        NSUInteger dimension = round(self.userAvatar.frame.size.width * [[UIScreen mainScreen] scale]);
//        NSURL *imageURL =
//        [[GIDSignIn sharedInstance].currentUser.profile imageURLWithDimension:dimension];
//        NSData *avatarData = [NSData dataWithContentsOfURL:imageURL];
//
//        if (avatarData) {
//            // Update UI from the main thread when available
//            dispatch_async(dispatch_get_main_queue(), ^{
//                SignInViewController *strongSelf = weakSelf;
//                if (strongSelf) {
//                    strongSelf.userAvatar.image = [UIImage imageWithData:avatarData];
//                }
//            });
//        }
//    });
}



@end
