//
//  AccountsAndAddressesNavigationController.m
//  Blockchain
//
//  Created by Kevin Wu on 1/12/16.
//  Copyright © 2016 Qkos Services Ltd. All rights reserved.
//

#import "AccountsAndAddressesNavigationController.h"
#import "AppDelegate.h"
#import "AccountsAndAddressesViewController.h"

@interface AccountsAndAddressesNavigationController ()

@end

@implementation AccountsAndAddressesNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, app.window.frame.size.width, app.window.frame.size.height);
    
    UIView *topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, DEFAULT_HEADER_HEIGHT)];
    topBar.backgroundColor = COLOR_BLOCKCHAIN_BLUE;
    [self.view addSubview:topBar];
    
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 17.5, self.view.frame.size.width - 160, 40)];
    headerLabel.font = [UIFont systemFontOfSize:22.0];
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.adjustsFontSizeToFitWidth = YES;
    headerLabel.text = BC_STRING_ADDRESSES;
    [topBar addSubview:headerLabel];
    self.headerLabel = headerLabel;
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0);
    [backButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [backButton setImage:[UIImage imageNamed:@"back_chevron_icon"] forState:UIControlStateNormal];
    [backButton setTitleColor:[UIColor colorWithWhite:0.56 alpha:1.0] forState:UIControlStateHighlighted];
    [backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [topBar addSubview:backButton];
    self.backButton = backButton;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    if (self.viewControllers.count == 1 || [self.visibleViewController isMemberOfClass:[AccountsAndAddressesViewController class]]) {
        self.backButton.frame = CGRectMake(self.view.frame.size.width - 80, 15, 80, 51);
        self.backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        self.backButton.titleLabel.adjustsFontSizeToFitWidth = YES;
        [self.backButton setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 10.0, 0.0, 10.0)];
        [self.backButton setTitle:BC_STRING_CLOSE forState:UIControlStateNormal];
        [self.backButton setImage:nil forState:UIControlStateNormal];
    } else {
        self.backButton.frame = CGRectMake(0, 12, 85, 51);
        self.backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.backButton setTitle:@"" forState:UIControlStateNormal];
        [self.backButton setImage:[UIImage imageNamed:@"back_chevron_icon"] forState:UIControlStateNormal];
    }
}

- (IBAction)backButtonClicked:(UIButton *)sender
{
    if ([self.visibleViewController isMemberOfClass:[AccountsAndAddressesViewController class]]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self popViewControllerAnimated:YES];
    }
}

@end