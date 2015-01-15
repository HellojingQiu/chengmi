//
//  LifeDetailsViewController.h
//  城觅
//
//  Created by qianfeng on 14-12-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeDetailsViewController : UIViewController
@property (nonatomic,copy)NSString *uid;
@property (nonatomic,copy)NSString *imageUrl;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *address;
@property (nonatomic,copy)NSString *gender;
@property (nonatomic,copy)NSString *avatar;
@property (nonatomic,copy)NSString *describes;
@property (nonatomic,copy)NSString *reccnt;//推荐
@property (nonatomic,copy)NSString *colcnt;
@property (nonatomic,copy)NSString *likecnt;
@end
