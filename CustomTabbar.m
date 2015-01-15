//
//  CustomTabbar.m
//  爱限免_new
//
//  Created by qianfeng on 14-11-17.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "CustomTabbar.h"

@implementation CustomTabbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f] forState:UIControlStateSelected];
        [self setBackgroundImage:[UIImage imageNamed:@"tabBar_Slider"] forState:UIControlStateSelected];
    }
    return self;
}

//取消按钮的高亮转台
- (void)setHighlighted:(BOOL)highlighted
{
    
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 29, contentRect.size.width, 20);
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake((contentRect.size.width-29)/2, 2, 29, 29);
}


@end
