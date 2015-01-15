//
//  LifeDetailsViewController.m
//  城觅
//
//  Created by qianfeng on 14-12-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "LifeDetailsViewController.h"
#import "UIImageView+WebCache.h"
#import "RecommendedViewController.h"
#import "CollectionViewController.h"
#import "PraiseViewController.h"
#import "CustomButton.h"

@interface LifeDetailsViewController ()<UIScrollViewDelegate,UIPageViewControllerDataSource,UIPageViewControllerDelegate>
{
    UIScrollView *_topView;
    UIScrollView *_footView;
    UIImageView *_imageView;
    
    UIView *_mainView;
    
    
    UIPageViewController *_pageVC;
    NSMutableArray *_dataArray;
    NSInteger _currentPage;
    
    BOOL _isGes;
    
    UIView *_titleView;
    
}

@end

@implementation LifeDetailsViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _isGes = YES;
    [self.navigationController.navigationBar setHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataArray = [[NSMutableArray alloc]init];
    
    RecommendedViewController *recommendVC = [[RecommendedViewController alloc]init];
    CollectionViewController *collectVC = [[CollectionViewController alloc]init];
    PraiseViewController *praVC = [[PraiseViewController alloc]init];
    [_dataArray addObject:recommendVC];
    [_dataArray addObject:collectVC];
    [_dataArray addObject:praVC];
    
    NSLog(@"name = %@",_name);
    [self createData];
    [self createUI];
    [self configPageViewController];
    
    
}

- (void)createData
{
    
}

- (void)createUI
{
    [self createtop];
    [self createfoot];
    [self createmiddleButton];
    [self createTitleView];
}

- (void)createtop
{
    _mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 20, __kScreenWidth, 890)];
    _mainView.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, __kScreenWidth, 450)];
    _imageView.userInteractionEnabled = YES;
    [_imageView setImageWithURL:[NSURL URLWithString:_imageUrl]];
   
    UIImageView *bgimageView = [[UIImageView alloc]initWithFrame:_imageView.bounds];
    bgimageView.userInteractionEnabled = YES;
    bgimageView.alpha = 0.8;
    bgimageView.image = [UIImage imageNamed:@"EXP_detail_headerCover_4"];
    
     [_imageView addSubview:bgimageView];
    
    
    //手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]init];
    swipe.direction = UISwipeGestureRecognizerDirectionUp;
    [swipe addTarget:self action:@selector(swipeAction:)];
    [_imageView addGestureRecognizer:swipe];
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]init];
    tapGes.numberOfTapsRequired = 1;
    [tapGes addTarget:self action:@selector(tapGesClick:)];
    [_imageView addGestureRecognizer:tapGes];
    
    
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 2, 60, 20)];
    nameLabel.textColor = [UIColor whiteColor];
    nameLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.text = _name;
    [_imageView addSubview:nameLabel];
    
    UILabel *addressLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 20, 80, 20)];
    addressLabel.textColor = [UIColor whiteColor];
    addressLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:10];
    addressLabel.textAlignment = NSTextAlignmentLeft;
    addressLabel.text = _address;
    [_imageView addSubview:addressLabel];
    
    UIImageView *imagelife = [[UIImageView alloc]initWithFrame:CGRectMake(addressLabel.bounds.size.width+43, 20, 47, 15)];
    imagelife.image = [UIImage imageNamed:@"EXPRoleLogo.png"];
    [_imageView addSubview:imagelife];
    
    UIImageView *gender = [[UIImageView alloc]initWithFrame:CGRectMake(125, 8, 10, 10)];
    NSString *sex = [NSString stringWithFormat:@"%@",_gender];
    if ([sex isEqualToString:@"1"]) {
        gender.image = [UIImage imageNamed:@"userDetail_sex_man"];
    }else{
        gender.image = [UIImage imageNamed:@"userDetail_sex_woman"];
    }
    [_imageView addSubview:gender];
    
    UILabel *describeslabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 300, 90)];
    describeslabel.numberOfLines = 6;
    describeslabel.text = _describes;
    describeslabel.textColor = [UIColor whiteColor];
    describeslabel.font = [UIFont fontWithName:@"Helvetica Neue" size:12];
    describeslabel.textAlignment = NSTextAlignmentCenter;
    describeslabel.center = CGPointMake(_imageView.bounds.size.width/2, _imageView.bounds.size.height/1.2);
    [_imageView addSubview:describeslabel];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 20, 65, 50);
    [back addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [back setBackgroundImage:[UIImage imageNamed:@"return_button"] forState:UIControlStateNormal];
    //------------------------------------------------------------
    
   
    [_mainView addSubview:_imageView];
    
    [self.view addSubview:_mainView];
    [self.view addSubview:back];
}

- (void)createTitleView
{
    _titleView = [[UIView alloc]initWithFrame:CGRectMake(60, 393, 150, 38)];
    
    UIImageView *iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    [iconImage setImageWithURL:[NSURL URLWithString:_avatar]];
    iconImage.layer.cornerRadius = 20;
    iconImage.layer.masksToBounds = YES;
    
    UILabel *titleName = [[UILabel alloc]initWithFrame:CGRectMake(45, 8, 60, 20)];
    titleName.textColor = [UIColor whiteColor];
    //    titleName.backgroundColor = [UIColor grayColor];
    titleName.font = [UIFont fontWithName:@"Helvetica Neue" size:14];
    titleName.textAlignment = NSTextAlignmentLeft;
    titleName.text = _name;
    
    
    UIImageView *titlelife = [[UIImageView alloc]initWithFrame:CGRectMake(108, 11, 47, 15)];
    titlelife.image = [UIImage imageNamed:@"EXPRoleLogo.png"];
    
    [_titleView addSubview:titlelife];
    [_titleView addSubview:titleName];
    [_titleView addSubview:iconImage];
    [_mainView addSubview:_titleView];
    [_titleView setHidden:YES];
}
- (void)createmiddleButton
{
    NSString *reccnt = [NSString stringWithFormat:@"%@",_reccnt];
    NSString *colcnt = [NSString stringWithFormat:@"%@",_colcnt];
    NSString *likecnt = [NSString stringWithFormat:@"%@",_likecnt];
    NSMutableArray *titleArrLabel = [[NSMutableArray alloc]init];
    [titleArrLabel addObject:reccnt];
    [titleArrLabel addObject:colcnt];
    [titleArrLabel addObject:likecnt];
    
    NSArray *titleArr = @[@"推荐",@"收藏",@"获赞"];
    for (int i = 0; i<titleArr.count; i++) {
        CustomButton *titleBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(28, 0, 50, 20)];
        titleLabel.text = titleArrLabel[i];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        [titleBtn addSubview:titleLabel];
        
        
        titleBtn.frame = CGRectMake((__kScreenWidth/3)*i, 450, __kScreenWidth/3, 40);
        titleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        titleBtn.tag = 100 + i;
        [titleBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        titleBtn.backgroundColor = [UIColor colorWithRed:0.26f green:0.26f blue:0.26f alpha:1.00f];
        [titleBtn setTitle:titleArr[i] forState:UIControlStateNormal];
        
        [_mainView addSubview:titleBtn];
    }
}
- (void)btnClick:(UIButton *)btn
{
    NSInteger index = btn.tag - 100;
    UIViewController *vc =  _dataArray[index];
    NSInteger direct = _currentPage>index?1:0;
    [_pageVC setViewControllers:@[vc] direction:direct animated:YES completion:nil];
    _currentPage = index;
}



- (void)configPageViewController
{
    _pageVC = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:0 options:nil];
    
    
    ((RecommendedViewController *)_dataArray[0]).uid=_uid;
    [_pageVC setViewControllers:@[_dataArray[0]] direction:0 animated:NO completion:nil];
    _pageVC.dataSource = self;
    _pageVC.delegate = self;
    _pageVC.view.frame = CGRectMake(0, 490, __kScreenWidth, 400);
    [_mainView addSubview:_pageVC.view];
}

#pragma mark UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSInteger index = [_dataArray indexOfObject:viewController];
    index--;
    if (index<0) {
        return nil;
    }
    return _dataArray[index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSInteger index = [_dataArray indexOfObject:viewController];
    index++;
    if (index>=_dataArray.count) {
        return nil;
    }
    return _dataArray[index];
}


- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    UIViewController *vc = pageViewController.viewControllers[0];
    NSInteger index = [_dataArray indexOfObject:vc];
    _currentPage = index;
}





#pragma mark UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y>300) {
        [UIView animateWithDuration:0.3 animations:^{
            for (UIView *view in _imageView.subviews) {
                view.hidden = YES;
            }
        }];
    }else if(scrollView.contentOffset.y<300)
    {
        [UIView animateWithDuration:0.6 animations:^{
            for (UIView *view in _imageView.subviews) {
                view.hidden = NO;
            }
        }];
    }
    
}

- (void)tapGesClick:(UITapGestureRecognizer *)ges
{
    if (_isGes) {
        [UIView animateWithDuration:0.5 animations:^{
            _mainView.center = CGPointMake(_mainView.center.x, _mainView.center.y-390);
            for (UIView *view in _imageView.subviews) {
                view.hidden = YES;
            }
            [_titleView setHidden:NO];
        }];
        _isGes = NO;
    }else
    {
        [UIView animateWithDuration:0.7 animations:^{
            _mainView.center = CGPointMake(_mainView.center.x, _mainView.center.y+390);
            for (UIView *view in _imageView.subviews) {
                view.hidden = NO;
            }
            [_titleView setHidden:YES];
        }];
        _isGes = YES;
    }
    
    NSLog(@"ddd");
}

- (void)swipeAction:(UISwipeGestureRecognizer *)ges
{
    [UIView animateWithDuration:0.5 animations:^{
        _mainView.center = CGPointMake(_mainView.center.x, _mainView.center.y-390);
        for (UIView *view in _imageView.subviews) {
            view.hidden = YES;
        }
        [_titleView setHidden:NO];
    }];
    _isGes = NO;
}
//--------------------------------------------------------------------
- (void)createfoot
{
    
}

//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    CGPoint point = [touch locationInView:self.view];
//    NSLog(@"%f,%f",point.x,point.y);
//}



- (void)btnAction:(UIButton *)btn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    [self.navigationController.navigationBar setHidden:NO];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self.navigationItem setHidesBackButton:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    [self.navigationItem setHidesBackButton:YES];
}





@end
