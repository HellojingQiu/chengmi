//
//  RecommendModel.m
//  城觅
//
//  Created by qianfeng on 14-12-17.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel

+(NSMutableArray *)paringJsonWithData:(NSData *)data
{
    NSMutableArray *resArr = [[NSMutableArray alloc]init];
    NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSArray *arr = resDict[@"recomendlist"];
    for (NSDictionary *dic in arr) {
        RecommendModel *model = [[RecommendModel alloc]init];
        model.uid = dic[@"uid"];
        model.viewcount = dic[@"viewcount"];
        model.sectitle = dic[@"sectitle"];
        model.title = dic[@"title"];
        model.article = dic[@"article"];
        model.pics = dic[@"pics"];
        model.likecnt = dic[@"likecnt"];
        
        [resArr addObject:model];
    }
    return resArr;
}

@end
