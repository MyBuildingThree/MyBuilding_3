//
//  CompanyTableViewCell.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyModel.h"

@interface CompanyTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *companyIndustry;
@property(nonatomic,strong)UILabel *companyName;
@property(nonatomic,strong)UILabel *companyDesc;
@property(nonatomic,strong)UIButton *headImageBtn;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)CompanyModel *model;
@end
