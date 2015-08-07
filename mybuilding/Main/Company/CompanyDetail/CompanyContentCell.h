//
//  CompanyContentCell.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyContentCell : UITableViewCell
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)NSString *content;
@property(nonatomic,strong)UIView *cutLine;
+(CGFloat)carculateCellHeightWithString:(NSString *)str;
@end
