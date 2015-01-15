//
//  RecommendModel.h
//  城觅
//
//  Created by qianfeng on 14-12-17.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendModel : NSObject
@property (nonatomic,copy)NSString *uid;
@property (nonatomic,copy)NSString *title;//标题
@property (nonatomic,copy)NSString *article;//介绍
@property (nonatomic,strong)NSArray  *pics;//图片
@property (nonatomic,copy)NSString *address;//地址
@property (nonatomic,copy)NSNumber *viewcount;//浏览
@property (nonatomic,copy)NSString *sectitle;//详情页面title
@property (nonatomic,copy)NSNumber *likecnt;//赞


+(NSMutableArray *)paringJsonWithData:(NSData *)data;


@end
