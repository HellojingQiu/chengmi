//
//  TopHomeModel.h
//  城觅
//
//  Created by qianfeng on 14-12-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#define __string(__param__)@property (nonatomic,copy)NSString *__param__

@interface TopHomeModel : NSObject

__string(status);
__string(color);
__string(iconurl);
__string(descriptioninfo);


+(NSMutableArray *)paringJsonWithData:(NSData *)data;

@end
