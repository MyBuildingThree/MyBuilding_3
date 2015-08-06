//
//  RequirementsTableViewCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RequirementsTableViewCell.h"
#import "RKShadowView.h"
#import "UIView+ViewKit.h"
#import "RKViewFactory.h"

@implementation RequirementsTableViewCell
+(CGFloat)carculateCellHeightWithModel:(RequirementsModel *)cellModel{
    CGFloat height = 0;
    height += [RKViewFactory autoLabelWithMaxWidth:kScreenWidth-30 maxHeight:40 font:[UIFont systemFontOfSize:14] content:cellModel.a_reqDesc];
    height +=148;
    return height;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headImageBtn];
        [self.contentView addSubview:self.userNameLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.timeImageView];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.bottomView];
    }
    return self;
}


@end
