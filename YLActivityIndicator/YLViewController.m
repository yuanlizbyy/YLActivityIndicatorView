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
	// Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView* sv = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 40, 100, 100)];
    sv.backgroundColor = [UIColor clearColor];
    [self.view addSubview:sv];
    sv.contentSize = CGSizeMake(100, 105);
    YLActivityIndicatorView* v = [[YLActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    v.backgroundColor = [UIColor clearColor];
    [sv addSubview:v];
    [v startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
