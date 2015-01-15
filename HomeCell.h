//
//  HomeCell.h
//  城觅
//
//  Created by qianfeng on 14-12-9.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface HomeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shadowView;
@property (weak, nonatomic) IBOutlet UIImageView *pic;
@property (weak, nonatomic) IBOutlet UILabel *shortname;
@property (weak, nonatomic) IBOutlet UILabel *short_addr;
@property (weak, nonatomic) IBOutlet UIButton *collectButton;
@property (weak, nonatomic) IBOutlet UILabel *collectcnt;


@property (nonatomic,strong)HomeModel *model;

@end
