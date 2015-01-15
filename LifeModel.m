//
//  LifeModel.m
//  城觅
//
//  Created by qianfeng on 14-12-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "LifeModel.h"

@implementation LifeModel
+(NSMutableArray *)paringJsonWithData:(NSData *)data
{
    NSMutableArray *resArr = [[NSMutableArray alloc]init];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *arr = dic[@"users"];
    for (NSDictionary *dict in arr) {
        LifeModel *model = [[LifeModel alloc]init];
        model.secid = dict[@"secid"];
        model.exptag = dict[@"exptag"];
        model.sectitle = dict[@"sectitle"];
        model.name = dict[@"name"];
        model.city = dict[@"city"];
        model.gender = dict[@"gender"];
        model.abstract = dict[@"abstract"];
        model.addres = dict[@"address"];
        model.ownpic = dict[@"ownpic"];
        model.avatar = dict[@"avatar"];
        model.homepic = dict[@"homepic"];
        model.describes = dict[@"describes"];
        model.articleid = dict[@"articleid"];
        model.title = dict[@"title"];
        model.reccnt = dict[@"reccnt"];
        model.uid = dict[@"uid"];
        model.likecnt = dict[@"likecnt"];
        model.article = dict[@"article"];
        model.colcnt = dict[@"colcnt"];
        model.priority = dict[@"priority"];
        [resArr addObject:model];
    }
    return resArr;
}
@end
