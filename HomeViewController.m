//
//  HomeViewController.m
//  城觅
//
//  Created by qianfeng on 14-12-9.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "TopHomeCell.h"
#import "CityViewController.h"
#import "DetailedViewController.h"
#import "EGORefreshTableHeaderView.h"


@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate>
{
    UITableView *_tableView;
    UIImageView *_navigationBar;
    NSMutableArray *_dataArray;
    NSMutableArray *_dataArray2;
    
    UIImageView *_imageView;
    
    BOOL _isCity;
    
    BOOL _isDownRefresh;
    BOOL _isUpRefresh;
    
    EGORefreshTableHeaderView *_EGORefreshView;
    
    NSString *_date;
    

    NSInteger year,month,day,hour,min,sec,week;
    NSString *weekStr;
    
}

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (IOS7) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self createCustomTarbar];
    [self createUI];
    [self createData];
    
}

- (void)createData
{
   _dataArray = [[NSMutableArray alloc]init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYYMMdd"];
    _date = [formatter stringFromDate:[NSDate date]];
    NSLog(@"datadatadata = %@",_date);
    [self loadData];
}

- (void)loadData
{
    NSString *strUrl = [NSString stringWithFormat:@"http://api.chengmi.com/shindex?passdate=%@&curlng=121.5137489718531&curlat=31.27264873880862",_date];
    [[HttpRequestManager sharedManager]GET:strUrl success:^(NSData *data) {
        if (_isDownRefresh) {
            _dataArray = [HomeModel parsingJsonData:data];
            _isDownRefresh = NO;
            [_EGORefreshView egoRefreshScrollViewDataSourceDidFinishedLoading:_tableView];
        }else{
            [_dataArray addObjectsFromArray:[HomeModel parsingJsonData:data]];
            
        }
        [_tableView reloadData];
    } failed:^{
        _isDownRefresh = NO;
        [_EGORefreshView egoRefreshScrollViewDataSourceDidFinishedLoading:_tableView];
    }];
}
- (void)loadMore
{
    
//    NSDate *priday=[NSDate dateWithTimeInterval:-60*60*24 sinceDate:_datePage];
//    NSDateFormatter *form=[[NSDateFormatter alloc]init];
//    [form setDateFormat:@"yyyyMMdd"];
//    NSString *str=[form stringFromDate:priday];
    
    NSDate* date = [[NSDate alloc] init];
    date = [date dateByAddingTimeInterval:-1*3600*24];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYYMMdd"];
    NSString *beforeDate = [formatter stringFromDate:date];
    _date = beforeDate;
    NSLog(@"_date_date_date = %@",_date);
    [self loadData];
    
}

- (void)createCustomTarbar
{
    self.navigationController.navigationBar.translucent = NO;

    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(-5, 0, 60, 40)];
    view.userInteractionEnabled = YES;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 10, 30, 20);
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitle:@"上海" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(CityAction) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 18, 7, 4  )];
    _imageView.image = [UIImage imageNamed:@"city_down"];
    [view addSubview:_imageView];
    
    UIBarButtonItem *liftBarbutton = [[UIBarButtonItem alloc]initWithCustomView:view];
    self.navigationItem.leftBarButtonItem = liftBarbutton;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.21f green:0.77f blue:0.70f alpha:1.00f]];
}

- (void)CityAction
{
    if (_isCity) {
        _imageView.image = [UIImage imageNamed:@"city_down"];
        _isCity = NO;
    }else{
        _isCity = YES;
        _imageView.image = [UIImage imageNamed:@"city_up"];
    }
}

- (void)createUI
{
    _navigationBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, IOS7?20:0, __kScreenWidth, 44)];
    [_navigationBar setImage:[UIImage imageNamed:@"button_login_bg"]];
    _navigationBar.backgroundColor = [UIColor blackColor];
    _navigationBar.userInteractionEnabled = YES;
    [self.view addSubview:_navigationBar];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, __kScreenWidth, __kScreenHeight-44-64) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self followRollingScrollView:_tableView];
    [self.view addSubview:_tableView];
    
    _EGORefreshView = [[EGORefreshTableHeaderView alloc]initWithFrame:CGRectMake(0, -_tableView.bounds.size.height, __kScreenWidth, _tableView.bounds.size.height)];
    _EGORefreshView.delegate = self;
    [_tableView addSubview:_EGORefreshView];
    
}

- (void)createSeachBarDc
{
    
}
- (void)refreshUI
{
    _isDownRefresh = YES;
    [self createData];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _dataArray.count-1) {
        return 44;
    }
    if (indexPath.row%11==0) {
        return 80;
    }
    return 128;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _dataArray.count-1) {
        static NSString *cellid = @"cellloadmore";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        cell.textLabel.text = @"加载更多";
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    }
    if(indexPath.row%11==0){
        static NSString *tcellid = @"tcellid";
        TopHomeCell  *tCell = [tableView dequeueReusableCellWithIdentifier:tcellid];
        if (!tCell) {
            tCell = [[[NSBundle mainBundle]loadNibNamed:@"TopHomeCell" owner:nil options:nil]lastObject];
        }
        tCell.tmodel = _dataArray[indexPath.row];
        return tCell;
    }else{
        static NSString *cellid = @"cellid";
        HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if (!cell) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"HomeCell" owner:nil options:nil]firstObject];
        }
        cell.model = _dataArray[indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.row%11 == 0){
        NSLog(@"hahhahhhh");
    }else if (indexPath.row == _dataArray.count-1) {
        [self loadMore];
    }else{
        DetailedViewController *detaileVc = [[DetailedViewController alloc]init];
        detaileVc.sid = [_dataArray[indexPath.row]sid];
        [self.navigationController pushViewController:detaileVc animated:YES];
    }
    
}

#pragma mark EGORefreshTableHeaderDelegate


- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view
{
    [self refreshUI];
}
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view
{
    return _isDownRefresh;
}
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view
{
    return [NSDate date];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_EGORefreshView egoRefreshScrollViewDidScroll:scrollView];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [_EGORefreshView egoRefreshScrollViewDidEndDragging:scrollView];
}

/*
- (void)pullUp
{
    NSDate* date = [[NSDate alloc] init];
    date = [date dateByAddingTimeInterval:-1*3600*24];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYYMMdd"];
    NSString *beforeDate = [formatter stringFromDate:date];
    _date = beforeDate;
    [self loadData];
    
}
 */
/*
-(void)getDate
{
    weekStr=nil;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now = [NSDate date];;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    comps = [calendar components:unitFlags fromDate:now];
    year = [comps year];
    week = [comps weekday];
    NSLog(@"week=%d",week);
    month = [comps month];
    day = [comps day];
    hour = [comps hour];
    min = [comps minute];
    sec = [comps second];
    
    if(week==1)
    {
        weekStr=@"星期天";
    }else if(week==2){
        weekStr=@"星期一";
        
    }else if(week==3){
        weekStr=@"星期二";
        
    }else if(week==4){
        weekStr=@"星期三";
        
    }else if(week==5){
        weekStr=@"星期四";
        
    }else if(week==6){
        weekStr=@"星期五";
        
    }else if(week==7){
        weekStr=@"星期六";
        
    }
    else {
        NSLog(@"error!");
    }
    
    NSLog(@"现在是:%d年%d月%d日 %d时%d分%d秒  %@",year,month,day,hour,min,sec,weekStr);
}
 */


@end
