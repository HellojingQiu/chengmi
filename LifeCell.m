//
//  LifeCell.m
//  城觅
//
//  Created by qianfeng on 14-12-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "LifeCell.h"
#import "UIImageView+WebCache.h"

@implementation LifeCell

- (void)awakeFromNib
{
    
}

- (void)setModel:(LifeModel *)model
{
    _model = model;
    [_homepic setImageWithURL:[NSURL URLWithString:model.homepic]];
    _name.text = model.name;
    _exptag.text = model.exptag;
    _title.text = model.title;
    _article.text = model.article;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
