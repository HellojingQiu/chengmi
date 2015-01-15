//
//  CustomTabBarController.m
//  爱限免_new
//
//  Created by qianfeng on 14-11-17.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "CustomTabBarController.h"
#import "HomeViewController.h"
#import "FoundViewController.h"
#import "LifeViewController.h"
#import "MyViewController.h"

@interface CustomTabBarController ()
{
    UIImageView *_tabBar;
}

@end

@implementation CustomTabBarController



- (void)viewDidLoad
{
    [super viewDidLoad];

    //创建一个标签栏控制器  可以分为几部
    //1.隐藏系统自带的标签栏
    self.tabBar.hidden = YES;
    
    
    //4.创建视图控制器数组
    [self createViewControllers];
    
    //2.创建自定义标签栏
    [self createCustomTabbar];
    
    //3.创建标签
    [self createTabbars];
    
   
}

- (void)createCustomTabbar
{
    _tabBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, __kScreenHeight-49,__kScreenWidth, 49)];
    _tabBar.backgroundColor = [UIColor colorWithRed:0.18f green:0.18f blue:0.18f alpha:1.00f];
    _tabBar.userInteractionEnabled = YES;
    [self.view addSubview:_tabBar];
}
- (void)createTabbars
{
    NSArray *nomalImages = @[@"tabBar_indexNew",
                             @"tabBar_discoverNew",
                             @"tabBar_EXPNew",
                             @"tabBar_mineNew"];
    NSArray *selectedImages = @[@"tabBar_index2New",
                                @"tabBar_discover2New",
                                @"tabBar_EXP2New",
                                @"tabBar_mine2New"];
    for (int i = 0; i<selectedImages.count; i++) {
        UIButton *customBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        customBtn.frame = CGRectMake(i*(__kScreenWidth/4), 0, __kScreenWidth/4, 49);
        [_tabBar addSubview:customBtn];
        
        [customBtn setImage:[UIImage imageNamed:nomalImages[i]] forState:UIControlStateNormal];
        [customBtn setImage:[UIImage imageNamed:selectedImages[i]] forState:UIControlStateSelected];
        customBtn.tag = 100+i;
        [customBtn addTarget:self action:@selector(customClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i==0) {
            customBtn.selected = YES;
        }
        NSLog(@"%@",_tabBar.subviews);
        
    }
}
- (void)customClick:(UIButton *)btn
{
    NSInteger index = btn.tag - 100;
    for (UIButton *button in _tabBar.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            ((UIButton *)button).selected = NO;
        }
    }
    btn.selected = YES;
    self.selectedIndex = index;
}

- (void)createViewControllers
{
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    FoundViewController *foundVC = [[FoundViewController alloc]init];
    UINavigationController *foundNav = [[UINavigationController alloc]initWithRootViewController:foundVC];
    LifeViewController *lifeVC = [[LifeViewController alloc]init];
    UINavigationController *lifeNav = [[UINavigationController alloc]initWithRootViewController:lifeVC];
    MyViewController *mylVC = [[MyViewController alloc]init];
    NSMutableArray *arrVC = [NSMutableArray arrayWithObjects:homeNav,foundNav,lifeNav,mylVC, nil];
    self.viewControllers = arrVC;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
