//
//  SLLActivityIndicator.m
//  GerritApp
//
//  Created by Oleg Taranenko on 24/05/2019.
//  Copyright © 2019 Oleg Taranenko. All rights reserved.
//

#import "SLLActivityIndicator.h"


@interface SLLActivityIndicator ()

@property (nonatomic, strong) UIView *viewBackground;
@property (nonatomic, strong) UILabel *titleLabel;

@end


@implementation SLLActivityIndicator

- (instancetype)initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyle)style
{
    self = [super initWithActivityIndicatorStyle:style];
    if (self)
    {
        _viewBackground = [[UIView alloc] init];
        _viewBackground.layer.borderColor = [UIColor darkGrayColor].CGColor;
        _viewBackground.layer.borderWidth = 1.f;
        _viewBackground.layer.cornerRadius = 10.f;
        _viewBackground.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.85];
        _viewBackground.frame = CGRectMake(0, 0, 10, 10);
        [_viewBackground addSubview:self];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"Обновляем";
        _titleLabel.font = [UIFont systemFontOfSize:13 weight:UIFontWeightRegular];
        _titleLabel.frame = CGRectMake(0, 0, 10, 10);
        _titleLabel.textColor = [UIColor grayColor];
         [_viewBackground addSubview:_titleLabel];
    }
    return self;
}

+ (SLLActivityIndicator *)createActivityIndicatorForSubview:(UIView*)view
{
    SLLActivityIndicator *spinner = [[SLLActivityIndicator alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    spinner.hidesWhenStopped = YES;
    [view addSubview:spinner.viewBackground];
    [spinner updateViewConstraints];
    return spinner;
}

- (void)updateViewConstraints
{
    self.viewBackground.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:
     @[
       [self.viewBackground.centerYAnchor constraintEqualToAnchor: self.centerYAnchor ],
       [self.viewBackground.centerXAnchor constraintEqualToAnchor: self.centerXAnchor ],
       [self.viewBackground.heightAnchor constraintGreaterThanOrEqualToConstant:100],
       [self.viewBackground.widthAnchor constraintGreaterThanOrEqualToConstant:150],
       
       [self.titleLabel.centerXAnchor constraintEqualToAnchor: self.viewBackground.centerXAnchor],
       [self.titleLabel.bottomAnchor constraintEqualToAnchor: self.viewBackground.bottomAnchor constant:-10],
       ]];
}

- (void)startAnimating
{
    if ([self isAnimating])
    {
        return;
    }
    [super startAnimating];
    [UIView transitionWithView:self.viewBackground duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.viewBackground.hidden = NO;
                    }
                    completion:nil];
}

- (void)stopAnimating
{
    if (![self isAnimating])
    {
        return;
    }
    [super stopAnimating];
    [UIView transitionWithView:self.viewBackground duration:0.4 options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.viewBackground.hidden = YES;
                    }
                    completion:nil];
}

@end
