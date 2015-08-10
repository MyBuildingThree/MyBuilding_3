//
//  ContactWorkHistoryCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ContactWorkHistoryCell.h"
#import "RKShadowView.h"
#import "UIView+ViewKit.h"
#import "UILabel+LabelKit.h"
#import "NSString+LabelKit.h"

@implementation ContactWorkHistoryCell
+(CGFloat)carculateCellHeightWithString:(NSString *)str{
    CGFloat height = 0;
    CGRect size = [str autosizeWithFont:[UIFont systemFontOfSize:16] maxWidth:kScreenWidth-20];
    height += size.size.height+60;
    return height;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.companyNameLabel];
        [self.contentView addSubview:self.workDescLabel];
        [self.contentView addSubview:self.bottomView];
    }
    return self;
}

@end
