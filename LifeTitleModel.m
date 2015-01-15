//
//  LifeTitleModel.m
//  城觅
//
//  Created by qianfeng on 14-12-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "LifeTitleModel.h"

@implementation LifeTitleModel

+(NSMutableArray *)paringWithData:(NSData *)data
{
    NSMutableArray *resArr = [[NSMutableArray alloc]init];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    LifeTitleModel *titleModel = [[LifeTitleModel alloc]init];
    titleModel.status = dict[@"status"];
    titleModel.content = dict[@"content"];
    titleModel.img = dict[@"img"];
    [resArr addObject:titleModel];
    
    return resArr;
}

@end
