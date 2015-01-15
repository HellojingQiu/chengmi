//
//  FoundModel.m
//  城觅
//
//  Created by qianfeng on 14-12-11.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "FoundModel.h"



@implementation FoundModel


+(NSMutableArray *)paringJsonWithData:(NSData *)data
{
    NSMutableArray *resArr = [[NSMutableArray alloc]init];
    NSDictionary *MainDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    FoundModel *model = [[FoundModel alloc]init];
    model.areacnt = MainDic[@"areacnt"];
    NSArray *themeinfoArr = MainDic[@"themeinfo"];
    for (NSDictionary *infoDic in themeinfoArr) {
        FoundModel *model = [[FoundModel alloc]init];
        model.name = infoDic[@"name"];
        model.sec_cnt = infoDic[@"sec_cnt"];
        model.collect_cnt = infoDic[@"pic"];
        model.is_new = infoDic[@"is_new"];
        model.id = infoDic[@"id"];
    }
    model.allsectioncnt = MainDic[@"allsectioncnt"];
    NSArray *catinfoArr = MainDic[@"catinfo"];
    for (NSDictionary *infoDic1 in catinfoArr) {
        model.catcnt = infoDic1[@"catcnt"];
        model.catid = infoDic1[@"catid"];
        model.color = infoDic1[@"color"];
        model.catchild = infoDic1[@"catchild"];
        model.iconurl = infoDic1[@"iconurl"];
        model.catname = infoDic1[@"catname"];
        model.showpriority = infoDic1[@"showpriority"];
        model.selectpage = infoDic1[@"selectpage"];
    }
    
    NSArray *areainfoArr = MainDic[@"areainfo"];
    for (NSDictionary *infoDic3 in areainfoArr) {
        model.priority = infoDic3[@"priority"];
        model.iconurl = infoDic3[@"iconurl"];
        model.areaid = infoDic3[@"areaid"];
//        model.areacnt = infoDic3[@"areacnt"];
        model.areaname = infoDic3[@"areaname"];
    }
    
    [resArr addObject:model];
    return resArr;
}


@end
