//
//  LifeModel.h
//  城觅
//
//  Created by qianfeng on 14-12-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LifeModel : NSObject

@property (nonatomic,copy)NSString *secid;
@property (nonatomic,copy)NSString *exptag;
@property (nonatomic,copy)NSString *sectitle;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *city;
@property (nonatomic,copy)NSString *gender;
@property (nonatomic,copy)NSString *abstract;
@property (nonatomic,copy)NSString *addres;
@property (nonatomic,copy)NSString *ownpic;
@property (nonatomic,copy)NSString *avatar;
@property (nonatomic,copy)NSString *homepic;
@property (nonatomic,copy)NSString *describes;
@property (nonatomic,copy)NSString *articleid;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *reccnt;
@property (nonatomic,copy)NSString *uid;
@property (nonatomic,copy)NSString *likecnt;
@property (nonatomic,copy)NSString *article;
@property (nonatomic,copy)NSString *colcnt;
@property (nonatomic,copy)NSString *priority;

+(NSMutableArray *)paringJsonWithData:(NSData *)data;

@end
