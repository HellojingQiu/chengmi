//
//  FoundViewController.m
//  城觅
//
//  Created by qianfeng on 14-12-9.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "FoundViewController.h"
#import "FoundCell.h"
#import "FoundTopModel.h"
#import "MiddleModel.h"
#import "FootModel.h"
#import "FoundModel.h"
#import "UIImageView+WebCache.h"

@interface FoundViewController ()<UISearchBarDelegate,UISearchDisplayDelegate,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    UISearchBar *_customSearchBar;
    UISearchDisplayController *_searchDC;
    NSMutableArray *_dataArray;
    NSMutableArray *_dataArraymiddle;
    NSMutableArray *_dataFoot;
    
    UIScrollView *_mainView;
    
    MiddleModel *_mideleModel;
    FootModel *_footModel;
    
    FoundModel *_foundModel;
    
    NSString *_city;
    

    
}

@end

@implementation FoundViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)loadView
{
    _mainView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = _mainView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _mainView.userInteractionEnabled = YES;
    _mainView.showsVerticalScrollIndicator = NO;
    _mainView.showsHorizontalScrollIndicator = NO;
    _mainView.bounces = YES;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.21f green:0.77f blue:0.70f alpha:1.00f]];
    
    _customSearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    _searchDC = [[UISearchDisplayController alloc]initWithSearchBar:_customSearchBar contentsController:self];
    _searchDC.delegate = self;
    _searchDC.displaysSearchBarInNavigationBar = YES;
    _dataArray = [[NSMutableArray alloc]init];
    _dataArraymiddle = [[NSMutableArray alloc]init];
    _dataFoot = [[NSMutableArray alloc]init];
    [self createData];
    [self createUI];
    
}

- (void)createData
{
    NSString *str = @"shanghai";
    NSString *strUrl = [NSString stringWithFormat:@"http://api.chengmi.com/v1.9/discover?theme_ids=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,20,38,29,26,23,37,28,32,18,27,35,30,36,33,34,39,40&city=%@",str];
    _foundModel = [[FoundModel alloc]init];
    _city = [[NSString alloc]init];
    [[HttpRequestManager sharedManager]GET:strUrl success:^(NSData *data) {
    NSDictionary *manDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = manDic[@"themeinfo"];
        for (NSDictionary *infoDic in arr) {
            FoundTopModel *model = [[FoundTopModel alloc]init];
            model.name = infoDic[@"name"];
            model.sec_cnt = infoDic[@"sec_cnt"];
            model.pic = infoDic[@"pic"];
            model.collect_cnt = infoDic[@"collect_cnt"];
            model.is_new = infoDic[@"is_new"];
            model.id = infoDic[@"id"];
            [_dataArray addObject:model];
        }
        NSArray *arrmiddle = manDic[@"catinfo"];
        for (NSDictionary *infoDic1 in arrmiddle) {
            MiddleModel *model = [[MiddleModel alloc]init];
            model.catcnt = infoDic1[@"catcnt"];
            model.catid = infoDic1[@"catid"];
            model.color = infoDic1[@"color"];
            model.catchild = infoDic1[@"catchild"];
            model.iconurl = infoDic1[@"iconurl"];
            model.catname = infoDic1[@"catname"];
            model.showpriority = infoDic1[@"showpriority"];
            model.selectpage = infoDic1[@"selectpage"];
            [_dataArraymiddle addObject:model];
        }
        NSArray *footArr = manDic[@"areainfo"];
        for (NSDictionary *infoDic3 in footArr) {
            FootModel *model = [[FootModel alloc]init];
            model.priority = infoDic3[@"priority"];
            model.iconurl = infoDic3[@"iconurl"];
            model.areaid = infoDic3[@"areaid"];
            model.areacnt = infoDic3[@"areacnt"];
            model.areaname = infoDic3[@"areaname"];
            [_dataFoot addObject:model];
        }
        
        [self createUI];
        
    } failed:^{
        
    }];
    
}
- (CGFloat)createUI
{
    CGFloat top = [self createfoundTop];
    CGFloat middle = [self createmiddle:top];
    CGFloat titleName = [self createtitleCity:middle];
    CGFloat foot = [self createfoundFoot:titleName];
    _mainView.contentSize = CGSizeMake(320, foot + 80 +50);
    return foot;
}
//上部分图片
- (CGFloat)createfoundTop
{
    for (int i = 0; i<_dataArray.count; i++) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(1+159*(i%2)+1, 1+121*(i/2)+1, 157, 119)];
        imageView.userInteractionEnabled = YES;
        [imageView setImageWithURL:[NSURL URLWithString:[_dataArray[i]pic]] placeholderImage:
            [UIImage imageNamed:@"discoverNav_theme_default.png"]];
        
        UIImageView *imageicon = [[UIImageView alloc]init];
        NSString *isicon = [_dataArray[i]is_new];
        if ([isicon isEqualToString:@"old"]) {
            
        }else if ([isicon isEqualToString:@"default"]){
            imageicon.image = [UIImage imageNamed:@"discoverNav_top.png"];
        }
        imageicon.frame = CGRectMake(5, 5, 20, 20);
        [imageView addSubview:imageicon];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
        label.text = [_dataArray[i]name];
        label.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.center = CGPointMake(imageView.bounds.size.width/2, imageView.bounds.size.height/2.5);
        [imageView addSubview:label];
        
        UIImageView *collectionimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 15)];
        collectionimage.layer.cornerRadius = 5;
        collectionimage.layer.masksToBounds = YES;
        collectionimage.backgroundColor = [UIColor colorWithRed:0.71f green:0.32f blue:0.28f alpha:1.00f];
        collectionimage.center = CGPointMake(imageView.bounds.size.width/2, imageView.bounds.size.height/1.7);
        collectionimage.alpha = 0.7;
        
        UIImageView *imageViewLove = [[UIImageView alloc]initWithFrame:CGRectMake(5, 2, 11, 10)];
        imageViewLove.image = [UIImage imageNamed:@"mine_heart.png"];
        [collectionimage addSubview:imageViewLove];
        [imageView addSubview:collectionimage];
        
        
        UILabel *labelcollection = [[UILabel alloc]initWithFrame:CGRectMake(20, 2, 30, 10)];
        labelcollection.text = [NSString stringWithFormat:@"%@",[_dataArray[i]collect_cnt]];
        labelcollection.font = [UIFont systemFontOfSize:9];
        NSInteger sum =0;
        sum+=(NSInteger)labelcollection.text;
        NSLog(@"aaaaaaaaaaaaaaa%d",sum);
        labelcollection.textColor = [UIColor whiteColor];
        [collectionimage addSubview:labelcollection];
        [_mainView addSubview:imageView];
    }

    return 119*4;
}
//中间部分按钮
- (CGFloat)createmiddle:(CGFloat)stary
{
    UIScrollView *buttScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, stary+20, __kScreenWidth, 120)];
    buttScroll.userInteractionEnabled = YES;
    buttScroll.backgroundColor = [UIColor clearColor];
    buttScroll.showsVerticalScrollIndicator =NO;
    [_mainView addSubview:buttScroll];
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
//    label.text = [NSString stringWithFormat:@"%@",]
    for (int i = 0; i<_dataArraymiddle.count; i++) {
        UIImage *image = [[SDWebImageManager sharedManager]imageWithURL:[NSURL URLWithString:[_dataArraymiddle[i]iconurl]]];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(90*i+10, 10, 80, 80)];
        [buttScroll addSubview:view];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 60, 60);
        button.center = CGPointMake(view.bounds.size.width/2, view.bounds.size.height/2.5);
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [view addSubview:button];
        [UIColor colorWithRed:0.67f green:0.67f blue:0.67f alpha:1.00f];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 20)];
        label.text = [NSString stringWithFormat:@"%@",[_dataArraymiddle[i]catname]];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        label.center = CGPointMake(view.bounds.size.width/2.0, view.bounds.size.height/1.1);
        label.font = [UIFont systemFontOfSize:13];
        
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
        label3.center = CGPointMake(view.bounds.size.width/2.0, view.bounds.size.height/0.9);
        label3.text = [NSString stringWithFormat:@"%@",[_dataArraymiddle[i]catcnt]];
        label3.font = [UIFont systemFontOfSize:10];
        label3.textAlignment = NSTextAlignmentCenter;
        label3.textColor = [UIColor lightGrayColor];
        [view addSubview:label3];
        
        [view addSubview:label];
    }
    buttScroll.contentSize = CGSizeMake(_dataArraymiddle.count*120, 0);
    return stary + 110+10;
}

- (CGFloat)createtitleCity:(CGFloat)stary
{
    UILabel *citytitle = [[UILabel alloc]initWithFrame:CGRectMake(10, stary, 90, 20)];
    citytitle.font = [UIFont systemFontOfSize:10];
    citytitle.text =[NSString stringWithFormat:@"15个地区推荐"];
    citytitle.textColor = [UIColor redColor];
    [_mainView addSubview:citytitle];
    return stary+20;
}

//下部分按钮
- (CGFloat)createfoundFoot:(CGFloat)stary
{
    UIScrollView *footView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, stary+30, __kScreenWidth, 120)];
    footView.userInteractionEnabled = YES;
    footView.showsVerticalScrollIndicator = NO;
    [_mainView addSubview:footView];
    for (int i = 0; i<_dataFoot.count; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        [imageView setImageWithURL:[NSURL URLWithString:[_dataFoot[i]iconurl]] placeholderImage:[UIImage imageNamed:@"selectView_area_default"]];
        imageView.userInteractionEnabled = YES;
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(90*i+10, 20, 80, 80)];
        [footView addSubview:view];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //button.backgroundColor = [UIColor redColor];
        button.frame = CGRectMake(0, 0, 60, 60);
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        imageView.center = CGPointMake(view.bounds.size.width/2, view.bounds.size.height/2.5);
        [imageView addSubview:button];
        [view addSubview:imageView];
        UILabel *labelname = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90, 20)];
        labelname.text = [NSString stringWithFormat:@"%@",[_dataFoot[i]areaname]];
        labelname.textColor = [UIColor blackColor];
        labelname.textAlignment = NSTextAlignmentCenter;
        labelname.center = CGPointMake(view.bounds.size.width/2.0, view.bounds.size.height/1.1);
        labelname.font = [UIFont systemFontOfSize:12];
        
        
        UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 20)];
        label3.center = CGPointMake(view.bounds.size.width/2.0, view.bounds.size.height/0.9);
        label3.text = [NSString stringWithFormat:@"%@",[_dataFoot[i]areacnt]];
        label3.font = [UIFont systemFontOfSize:10];
        label3.textAlignment = NSTextAlignmentCenter;
        label3.textColor = [UIColor lightGrayColor];
        [view addSubview:labelname];
        [view addSubview:label3];
    }
    footView.contentSize = CGSizeMake(_dataFoot.count*90, 0);
    return stary+40;
}

- (void)btnAction:(UIButton *)button
{
    NSLog(@"打印了");
}
@end
