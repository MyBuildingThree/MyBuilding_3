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
+ (CGFloat)carculateCellHeightWithModel:(ProjectModel *)cellModel;
@end
