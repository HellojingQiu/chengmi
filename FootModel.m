//
//  FootModel.m
//  城觅
//
//  Created by qianfeng on 14-12-11.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "FootModel.h"

@implementation FootModel

+(NSMutableArray *)paringJsonWithData:(NSData *)data
{
    NSMutableArray *resArr = [[NSMutableArray alloc]init];
    NSDictionary *MainDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *areainfoArr = MainDic[@"areainfo"];
    for (NSDictionary *infoDic3 in areainfoArr) {
        FootModel *model = [[FootModel alloc]init];
        model.priority = infoDic3[@"priority"];
        model.iconurl = infoDic3[@"iconurl"];
        model.areaid = infoDic3[@"areaid"];
        model.areacnt = infoDic3[@"areacnt"];
        model.areaname = infoDic3[@"areaname"];
        NSLog(@"%@",model.iconurl);
        [resArr addObject:model];
    }
    return resArr;
}

@end
