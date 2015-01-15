//
//  LifeTitleModel.h
//  城觅
//
//  Created by qianfeng on 14-12-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LifeTitleModel : NSObject
@property (nonatomic,copy)NSString *status;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *img;


+(NSMutableArray *)paringWithData:(NSData *)data;
@end
