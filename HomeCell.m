//
//  HomeCell.m
//  城觅
//
//  Created by qianfeng on 14-12-9.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "HomeCell.h"
#import "UIImageView+WebCache.h"

@implementation HomeCell

- (void)awakeFromNib
{
    _shadowView.layer.cornerRadius = 3;
    _shadowView.layer.masksToBounds = YES;
    
    _pic.layer.cornerRadius = 3;
    _pic.layer.masksToBounds = YES;
}

- (void)setModel:(HomeModel *)model
{
    _model = model;
    [_pic setImageWithURL:[NSURL URLWithString:model.pic]placeholderImage:[UIImage imageNamed:@"indexCell_shadow.png"]];
    _shortname.text = model.shortname;
    _short_addr.text = model.short_addr;
    _collectcnt.text = [NSString stringWithFormat:@"%@",model.collect];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
