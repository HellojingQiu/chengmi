//
//  LifeCell.h
//  城觅
//
//  Created by qianfeng on 14-12-15.
//  Copyright (c) 2014年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LifeModel.h"
@interface LifeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *homepic;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *exptag;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *article;
@property (weak, nonatomic) IBOutlet UIImageView *liftImage;
@property (weak, nonatomic) IBOutlet UIImageView *rightimage;


@property (nonatomic,strong)LifeModel *model;

@end
