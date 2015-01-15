//
//  MiddleModel.h
//  城觅
//
//  Created by qianfeng on 14-12-11.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MiddleModel : NSObject

@property (nonatomic,strong)NSDictionary *catinfo;
@property (nonatomic,copy)NSString *catcnt;
@property (nonatomic,copy)NSString *catid;
@property (nonatomic,copy)NSString *color;
@property (nonatomic,copy)NSString *catchild;
@property (nonatomic,copy)NSString *iconurl;
@property (nonatomic,copy)NSString *catname;
@property (nonatomic,copy)NSString *showpriority;
@property (nonatomic,copy)NSString *selectpage;

+(NSMutableArray *)paringWithData:(NSData *)data;

@end
