//
//  RequirementsTableViewCell.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequirementsModel.h"
#import "RKImageLabel.h"

@interface RequirementsTableViewCell : UITableViewCell
@property(nonatomic,strong)UIButton *headImageBtn;
@property(nonatomic,strong)UILabel *userNameLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *reqTypeLabel;
@property(nonatomic,strong)RKImageLabel *timeLabel;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)RequirementsModel *model;
+(CGFloat)carculateCellHeightWithModel:(RequirementsModel *)cellModel;
@end
