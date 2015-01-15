//
//  FootModel.h
//  城觅
//
//  Created by qianfeng on 14-12-11.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FootModel : NSObject

@property (nonatomic,copy)NSString *priority;
@property (nonatomic,copy)NSString *iconurl;
@property (nonatomic,copy)NSString *areaid;
@property (nonatomic,copy)NSString *areacnt;
@property (nonatomic,copy)NSString *areaname;

+(NSMutableArray *)paringJsonWithData:(NSData *)data;

@end
