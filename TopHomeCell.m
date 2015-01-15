//
//  TopHomeCell.m
//  城觅
//
//  Created by qianfeng on 14-12-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "TopHomeCell.h"
#import "UIImageView+WebCache.h"
@implementation TopHomeCell

- (void)awakeFromNib
{
    _backImageView.layer.cornerRadius = 3;
    _backImageView.layer.masksToBounds = YES;
}

- (void)setTmodel:(HomeModel *)tmodel
{
    _tmodel = tmodel;
    NSString *str = [NSString stringWithFormat:@"%@",tmodel.color];
    UIColor *color = [self hexStringToColor:str];
    _backImageView.backgroundColor = color;
    [_iconView setImageWithURL:[NSURL URLWithString:tmodel.iconurl]];
    _descriptioninfoLabel.text = tmodel.descriptioninfo;
    NSString *data;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM月dd日"];
    data = [formatter stringFromDate:[NSDate date]];
    _weekLabel.text = data;
}

-(UIColor *) hexStringToColor: (NSString *) stringToConvert
{
    NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    
    if ([cString length] < 6) return [UIColor blackColor];
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];
    
    // Separate into r, g, b substrings
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    // Scan values
    unsigned int r, g, b;
    
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
