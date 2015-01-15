//
//  TopHomeCell.h
//  城觅
//
//  Created by qianfeng on 14-12-10.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface TopHomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *descriptioninfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekLabel;


@property (nonatomic,strong)HomeModel *tmodel;

@end
