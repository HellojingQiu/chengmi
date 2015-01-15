//
//  FoundModel.h
//  城觅
//
//  Created by qianfeng on 14-12-11.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FoundModel : NSObject

@property (nonatomic,copy)NSString *status;
//@property (nonatomic,copy)NSString *areacnt;
@property (nonatomic,copy)NSString *catcnt;

@property (nonatomic,strong)NSDictionary *areainfo;
@property (nonatomic,copy)NSString *priority;
@property (nonatomic,copy)NSString *iconurl;
@property (nonatomic,copy)NSString *areaid;
@property (nonatomic,copy)NSString *areacnt;
@property (nonatomic,copy)NSString *areaname;


@property (nonatomic,copy)NSString *allsectioncnt;
@property (nonatomic,strong)NSDictionary *themeinfo;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *sec_cnt;
@property (nonatomic,copy)NSString *collect_cnt;
@property (nonatomic,copy)NSString *pic;
@property (nonatomic,copy)NSString *is_new;
@property (nonatomic,copy)NSString *id;



@property (nonatomic,strong)NSDictionary *catinfo;
@property (nonatomic,copy)NSString *catinfocatcnt;
@property (nonatomic,copy)NSString *catid;
@property (nonatomic,copy)NSString *color;
@property (nonatomic,copy)NSString *catchild;
@property (nonatomic,copy)NSString *catinfoiconurl;
@property (nonatomic,copy)NSString *catname;
@property (nonatomic,copy)NSString *showpriority;
@property (nonatomic,copy)NSString *selectpage;


+(NSMutableArray *)paringJsonWithData:(NSData *)data;

@end
