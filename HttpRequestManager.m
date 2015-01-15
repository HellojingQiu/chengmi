//
//  HttpRequestManager.m
//  畅游旅行
//
//  Created by qianfeng on 14-12-8.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "HttpRequestManager.h"

@interface HttpRequest()<NSURLConnectionDataDelegate,NSURLConnectionDelegate>
{
    NSMutableData *_data;
}
@end

@implementation HttpRequest

- (instancetype)init
{
    self = [super init];
    if (self) {
        _data = [[NSMutableData alloc]init];
    }
    return self;
}

-(void)startRequest
{
    [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]] delegate:self];
}

#pragma mark NSURLConnectionDataDelegate
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_data setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"error = %@",error);
    _failCallback();
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _successCallback(_data);
}

@end

@implementation HttpRequestManager


+ (id)sharedManager
{
    static HttpRequestManager *_h;
    if (!_h) {
        _h = [[HttpRequestManager alloc]init];
    }
    return _h;
}

- (void)GET:(NSString *)url success:(void (^)(NSData *))okCallback failed:(void (^)())failCallback
{
    HttpRequest *req = [[HttpRequest alloc]init];
    req.url = url;
    req.successCallback = okCallback;
    req.failCallback =failCallback;
    
    [req startRequest];
}

@end
