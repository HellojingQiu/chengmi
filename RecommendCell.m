//
//  RecommendCell.m
//  城觅
//
//  Created by qianfeng on 14-12-17.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import "RecommendCell.h"
#import "UIImageView+WebCache.h"

@implementation RecommendCell

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor colorWithRed:0.82f green:0.82f blue:0.82f alpha:1.00f];
    _image1.layer.cornerRadius = 2;
    _image1.layer.masksToBounds = YES;
    
    _image2.layer.cornerRadius = 2;
    _image2.layer.masksToBounds = YES;
    
    _image3.layer.cornerRadius = 2;
    _image3.layer.masksToBounds = YES;
}
- (void)setModel:(RecommendModel *)model
{
    _model = model;
    _title.text = model.title;
    _article.text = model.article;
    for (int i = 0; i<model.pics.count; i++) {
        if (i==0) {
            [_image1 setImageWithURL:[NSURL URLWithString:model.pics[i]]placeholderImage:[UIImage imageNamed:@"articleList_noSmallImages"]];
        }else if(i==1)
        {
            [_image2 setImageWithURL:[NSURL URLWithString:model.pics[i]]placeholderImage:[UIImage imageNamed:@"articleList_noSmallImages"]];
        }else if (i==2)
        {
            [_image3 setImageWithURL:[NSURL URLWithString:model.pics[i]]placeholderImage:[UIImage imageNamed:@"articleList_noSmallImages"]];
        }
    }
    _viewcount.text = [model.viewcount stringValue];
    _likecnt.text = [model.likecnt stringValue];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
