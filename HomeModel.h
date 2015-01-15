//
//  HomeModel.h
//  城觅
//
//  Created by qianfeng on 14-12-9.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#define __string(__param__)@property (nonatomic,copy)NSString *__param__

@interface HomeModel : NSObject

__string(shortname);
__string(pic);
__string(short_addr);
__string(sid);
__string(collect);
__string(status);
__string(color);
__string(iconurl);
__string(descriptioninfo);
__string(weekString);


@property (nonatomic,strong)NSDictionary *collectcnt;
@property (nonatomic,assign)NSInteger dayNum;
@property (nonatomic,assign)NSInteger mouthNum;

+(NSMutableArray *)parsingJsonData:(NSData *)data;

@end
