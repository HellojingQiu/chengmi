//
//  LifeViewController.m
//  城觅
//
//  Created by qianfeng on 14-12-9.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "LifeViewController.h"
#import "LifeModel.h"
#import "LifeTitleModel.h"
#import "UIImageView+WebCache.h"
#import "LifeCell.h"
#import "LifeDetailsViewController.h"
#import "RecommendedViewController.h"

@interface LifeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_mainView;
    NSMutableArray *_dataArray;
    NSDictionary *_titleinfo;
}

@end

@implementation LifeViewController

- (void)viewDidLoad
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    imageView.image = [UIImage imageNamed:@"EXP_avatar_logo"];
    self.navigationItem.titleView = imageView;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.tintAdjustmentMode = UIViewTintAdjustmentModeAutomatic;
    self.navigationController.navigationBar.translucent = NO;
     [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.21f green:0.77f blue:0.70f alpha:1.00f]];
    [self createData];
    [self createUI];
}

- (void)createData
{
    [self loadData];
}

- (void)loadData
{
    _titleinfo = [[NSDictionary alloc]init];
    NSString *strCity = @"shanghai";
    NSString *strUrl = [NSString stringWithFormat:@"http://api.chengmi.com/v1.9.2/expuserlist?city=%@",strCity];
    [[HttpRequestManager sharedManager]GET:strUrl success:^(NSData *data) {
        _dataArray = [LifeModel paringJsonWithData:data];
        id res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _titleinfo = (NSDictionary *)res;
        NSLog(@"_titleinfo_titleinfo_titleinfo = %@",_titleinfo);
        [_mainView reloadData];
        [self createUI];
    } failed:^{
        
        
        
    }];
}

- (void)createUI
{
    
     UIImageView *topView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kScreenWidth, 300)];
    topView.userInteractionEnabled = YES;
     topView.backgroundColor = [UIColor clearColor];
     [topView setImageWithURL:[NSURL URLWithString:_titleinfo[@"img"]]];
     NSLog(@"aaaaaaa = %@",_titleinfo[@"img"]);
     
     UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 250, 90)];
     label.numberOfLines = 5;
     label.text = _titleinfo[@"content"];
     label.textColor = [UIColor whiteColor];
     label.center = CGPointMake(__kScreenWidth/1.9, 300/2);
     label.font = [UIFont systemFontOfSize:12];
     
     
     UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
     button.frame = CGRectMake(0, 0, 200, 30);
     [button setBackgroundImage:[UIImage imageNamed:@"button_login_bg"] forState:UIControlStateNormal];
     button.alpha = 1;
     button.center = CGPointMake(__kScreenWidth/2, 300/1.2);
     [button setTitle:@"我要加入" forState:UIControlStateNormal];
     [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     button.titleLabel.font = [UIFont systemFontOfSize:13];
     [topView addSubview:button];
     [topView addSubview:label];
    
    
    UIImageView *footView = [[UIImageView alloc]initWithFrame:CGRectMake(__kScreenWidth/2.6, 350*4+300, 80, 90)];
    footView.image = [UIImage imageNamed:@"articleList_dogLogo"];
    
    
    
    _mainView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, __kScreenWidth, __kScreenHeight-64-44)];
    _mainView.dataSource = self;
    _mainView.delegate = self;
    [_mainView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _mainView.tableHeaderView = topView;
    [_mainView addSubview:footView];
    [self.view addSubview:_mainView];
}



#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 350;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellid";
    LifeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"LifeCell" owner:nil options:nil]lastObject];
    }
    cell.model = _dataArray[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    LifeDetailsViewController *lifeDetailVC = [[LifeDetailsViewController alloc]init];
    lifeDetailVC.imageUrl = [_dataArray[indexPath.row]ownpic];
    lifeDetailVC.name = [_dataArray[indexPath.row]name];
    lifeDetailVC.address = [_dataArray[indexPath.row]city];
    lifeDetailVC.gender = [_dataArray[indexPath.row]gender];
    lifeDetailVC.avatar = [_dataArray[indexPath.row]avatar];
    lifeDetailVC.describes = [_dataArray[indexPath.row]describes];
    lifeDetailVC.reccnt = [_dataArray[indexPath.row]reccnt];
    lifeDetailVC.colcnt = [_dataArray[indexPath.row]colcnt];
    lifeDetailVC.likecnt = [_dataArray[indexPath.row]likecnt];
    lifeDetailVC.uid = [_dataArray[indexPath.row]uid];
    [self.navigationController pushViewController:lifeDetailVC animated:YES];
    
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y>260) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 150, 30);
        [button setBackgroundImage:[UIImage imageNamed:@"button_login_bg"] forState:UIControlStateNormal];
        button.alpha = 1;
        [button setTitle:@"我要加入" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:13];
        [UIView animateWithDuration:0.1 animations:^{
            self.navigationItem.titleView = button;
        }];
    }else if(scrollView.contentOffset.y<260){
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        imageView.image = [UIImage imageNamed:@"EXP_avatar_logo"];
        self.navigationItem.titleView = imageView;
    }
}





@end
