//
//  RecommendedViewController.m
//  城觅
//
//  Created by qianfeng on 14-12-16.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "RecommendedViewController.h"
#import "RecommendCell.h"

@interface RecommendedViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSInteger _currentPage;
}

@end

@implementation RecommendedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    NSLog(@"_uid = %@",_uid);
    [self createUI];
    [self createData];
    //APP孵化温室
    
}

- (void)createData
{
    _currentPage = 1;
    NSString *strUrl = [NSString stringWithFormat:@"http://api.chengmi.com/v1.9.2/expuser/recomendlist?uid=%@&city=shanghai&curpage=%d",_uid,_currentPage];
    [[HttpRequestManager sharedManager]GET:strUrl success:^(NSData *data) {
        _dataArray = [RecommendModel paringJsonWithData:data];
        [_tableView reloadData];
    } failed:^{
        
    }];
}

- (void)createUI
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, __kScreenWidth, __kScreenHeight-170)];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 205;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellid";
    RecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"RecommendCell" owner:nil options:nil]lastObject];
    }
    cell.model = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
