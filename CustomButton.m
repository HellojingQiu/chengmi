//
//  CustomButton.m
//  城觅
//
//  Created by qianfeng on 14-12-16.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return self;
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 20, contentRect.size.width, 20);
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
