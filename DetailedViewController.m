//
//  DetailedViewController.m
//  城觅
//
//  Created by qianfeng on 14-12-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()<UIScrollViewDelegate>
{
    UIScrollView *_topView;
    UIScrollView *_footView;
}

@end

@implementation DetailedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    NSLog(@"aaaa%@",_sid);
    
    [self createUI];
    [self createData];
    
}

- (void)createUI
{
    [self createTop];
    [self createfoot];
}

- (void)createTop
{
    _topView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, __kScreenWidth, 300)];
    _topView.delegate = self;
    _topView.userInteractionEnabled = YES;
    _topView.backgroundColor = [UIColor lightGrayColor];
    _topView.contentSize = CGSizeMake(__kScreenWidth, 300);
    [self.view addSubview:_topView];
    
    
}

- (void)createfoot
{
    
}

- (void)createData
{
    
}
@end
