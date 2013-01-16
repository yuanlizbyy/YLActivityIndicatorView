//
//  YLViewController.m
//  YLActivityIndicator
//
//  Created by Eric Yuan on 13-1-15.
//  Copyright (c) 2013年 jimu.tv. All rights reserved.
//

#import "YLViewController.h"
#import "YLActivityIndicatorView.h"

@interface YLViewController ()

@end

@implementation YLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    YLActivityIndicatorView* v1 = [[YLActivityIndicatorView alloc] init];
    v1.center = CGPointMake(160, 20);
    [self.view addSubview:v1];
    [v1 startAnimating];
    
    YLActivityIndicatorView* v2 = [[YLActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 20)];
    v2.center = CGPointMake(160, 55);
    v2.duration = .8f;
    [self.view addSubview:v2];
    [v2 startAnimating];
    
    YLActivityIndicatorView* v3 = [[YLActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 40, 15)];
    v3.center = CGPointMake(160, 90);
    v3.dotCount = 5;
    [self.view addSubview:v3];
    [v3 startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
