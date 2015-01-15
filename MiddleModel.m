//
//  MiddleModel.m
//  城觅
//
//  Created by qianfeng on 14-12-11.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "MiddleModel.h"

@implementation MiddleModel

+(NSMutableArray *)paringWithData:(NSData *)data
{
    NSMutableArray *resArr = [[NSMutableArray alloc]init];
    NSDictionary *MainDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *catinfoArr = MainDic[@"catinfo"];
    for (NSDictionary *infoDic1 in catinfoArr) {
        MiddleModel *model = [[MiddleModel alloc]init];
        model.catcnt = infoDic1[@"catcnt"];
        model.catid = infoDic1[@"catid"];
        model.color = infoDic1[@"color"];
        model.catchild = infoDic1[@"catchild"];
        model.iconurl = infoDic1[@"iconurl"];
        model.catname = infoDic1[@"catname"];
        model.showpriority = infoDic1[@"showpriority"];
        model.selectpage = infoDic1[@"selectpage"];
        [resArr addObject:model];
    }
    return resArr;
}
@end
