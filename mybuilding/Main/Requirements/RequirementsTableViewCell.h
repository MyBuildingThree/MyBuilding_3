//
//  RequirementsTableViewCell.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RequirementsTableViewCell : UITableViewCell
@property(nonatomic,strong)UIButton *headImageBtn;
@property(nonatomic,strong)UILabel *userNameLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIImageView *timeImageView;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIView *bottomView;
@end
