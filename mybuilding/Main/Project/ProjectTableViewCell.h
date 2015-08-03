//
//  ProjectTableViewCell.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProjectModel.h"

@interface ProjectTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *PCDLabel;
@property(nonatomic,strong)UILabel *projectName;
@property(nonatomic,strong)UILabel *projectStage;
@property(nonatomic,strong)UILabel *projectStageTitle;
@property(nonatomic,strong)UILabel *investment;
@property(nonatomic,strong)UILabel *investmentTitle;
@property(nonatomic,strong)UILabel *area;
@property(nonatomic,strong)UILabel *areaTitle;
@property(nonatomic,strong)UILabel *projectDescription;
@property(nonatomic,strong)UIView *bottomView;
@property(nonatomic,strong)UIImageView *cutLine1;
@property(nonatomic,strong)UIImageView *cutLine2;
@property(nonatomic,strong)ProjectModel *model;
+(CGFloat)carculateCellHeightWithModel:(ProjectModel *)cellModel;
@end
