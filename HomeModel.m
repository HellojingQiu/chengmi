//
//  HomeModel.m
//  城觅
//
//  Created by qianfeng on 14-12-9.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "HomeModel.h"
#import "TopHomeModel.h"

@implementation HomeModel
+(NSMutableArray *)parsingJsonData:(NSData *)data
{
    NSMutableArray *resArr = [[NSMutableArray alloc]init];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    TopHomeModel *tModel = [[TopHomeModel alloc]init];
    
    tModel.status = dict[@"status"];
    tModel.color = dict[@"color"];
    tModel.iconurl = dict[@"iconurl"];
    tModel.descriptioninfo = dict[@"descriptioninfo"];
    [resArr addObject:tModel];
    NSArray *arr = dict[@"sectioninfo"];
    for (NSDictionary *dic in arr) {
        HomeModel *model = [[HomeModel alloc]init];
        model.pic = dic[@"pic"];
        model.sid = dic[@"sid"];
        model.short_addr = dic[@"short_addr"];
        model.shortname = dic[@"shortname"];
        [resArr addObject:model];
        NSDictionary *collectcnt = dict[@"collectcnt"];
        NSString *str = dic[@"sid"];
        model.sid = str;
        model.collect = [collectcnt objectForKey:[NSString stringWithFormat:@"%@",str]];
        NSLog(@"%@",model.collect);
    }
    return resArr;
}
@end
