//
//  HttpRequestManager.h
//  畅游旅行
//
//  Created by qianfeng on 14-12-8.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject

@property (nonatomic,copy)NSString *url;
@property (nonatomic,copy)void(^successCallback)(NSData *);
@property (nonatomic,copy)void(^failCallback)();
@property (nonatomic,assign) NSInteger page;

- (void)startRequest;

@end

@interface HttpRequestManager : NSObject

+(id)sharedManager;

- (void)GET:(NSString *)url success:(void(^)(NSData *))okCallback failed:(void(^)())failCallback;


@end
