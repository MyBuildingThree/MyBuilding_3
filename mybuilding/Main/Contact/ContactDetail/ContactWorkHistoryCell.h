//
//  ContactWorkHistoryCell.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"

@interface ContactWorkHistoryCell : UITableViewCell
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *companyNameLabel;
@property(nonatomic,strong)UILabel *workDescLabel;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)PersonModel *model;
+(CGFloat)carculateCellHeightWithString:(NSString *)str;
@end
