//
//  FoundTopModel.m
//  城觅
//
//  Created by qianfeng on 14-12-11.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "FoundTopModel.h"

@implementation FoundTopModel
+(NSMutableArray *)paringJsonWithData:(NSData *)data
{
    NSMutableArray *resArr = [[NSMutableArray alloc]init];
    NSDictionary *MainDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *themeinfoArr = MainDic[@"themeinfo"];
    for (NSDictionary *infoDic in themeinfoArr) {
        FoundTopModel *model = [[FoundTopModel alloc]init];
        model.name = infoDic[@"name"];
        model.sec_cnt = infoDic[@"sec_cnt"];
        model.collect_cnt = infoDic[@"collect_cnt"];
        model.pic = infoDic[@"pic"];
        model.is_new = infoDic[@"is_new"];
        model.id = infoDic[@"id"];
        [resArr addObject:model];
    }
    return resArr;
}
@end
