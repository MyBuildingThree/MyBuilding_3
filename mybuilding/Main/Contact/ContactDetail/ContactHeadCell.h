//
//  ContactHeadCell.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"

@interface ContactHeadCell : UITableViewCell
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UILabel *userNameLabel;
@property(nonatomic,strong)UILabel *companyNameLabel;
@property(nonatomic,strong)UILabel *dutiesLabel;
@property(nonatomic,strong)UILabel *addressLabel;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)PersonModel *model;
@end
