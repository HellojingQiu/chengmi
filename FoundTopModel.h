//
//  FoundTopModel.h
//  城觅
//
//  Created by qianfeng on 14-12-11.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoundTopModel : NSObject

@property (nonatomic,copy)NSString *allsectioncnt;
@property (nonatomic,strong)NSDictionary *themeinfo;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *sec_cnt;
@property (nonatomic,copy)NSString *collect_cnt;
@property (nonatomic,copy)NSString *pic;
@property (nonatomic,copy)NSString *is_new;
@property (nonatomic,copy)NSString *id;

+(NSMutableArray *)paringJsonWithData:(NSData *)data;

@end
