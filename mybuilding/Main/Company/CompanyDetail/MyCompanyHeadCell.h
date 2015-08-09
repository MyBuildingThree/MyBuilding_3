//
//  MyCompanyHeadCell.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyModel.h"

@interface MyCompanyHeadCell : UITableViewCell
@property(nonatomic,strong)UIImageView *headImageView;
@property(nonatomic,strong)UILabel *companyName;
@property(nonatomic,strong)UILabel *contactName;
@property(nonatomic,strong)UILabel *emailLabel;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)CompanyModel *model;
@end
