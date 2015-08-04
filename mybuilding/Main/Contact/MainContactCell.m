//
//  MainContactCell.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MainContactCell.h"
#import "UIImageView+ViewKit.h"
#import "UIView+ViewKit.h"
#import "RKShadowView.h"
#import "PersonModel.h"

@implementation MainContactCell
@synthesize model = _model;

+ (CGFloat)carculateHeightWithModel:(id)model{
    return 96;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //头像
        self.mainImageView.frame = CGRectMake(10, 13, 60, 60);
        self.mainImageView.backgroundColor = [UIColor grayColor];
        [self.mainImageView setIsRound:YES];
        
        //用户名
        self.mainLabel.frame = CGRectMake(79, 13, kScreenWidth - self.mainImageView.maxX, 20);
        self.mainLabel.font = [UIFont systemFontOfSize:17];
        self.mainLabel.textColor = RGBCOLOR(51, 51, 51);
        
        //公司名称
        self.subLabel_1.frame = CGRectMake(79, 36.5, kScreenWidth - self.mainImageView.maxX, 20);
        self.subLabel_1.font = [UIFont systemFontOfSize:15];
        self.subLabel_1.textColor = RGBCOLOR(127, 127, 127);
        
        //职位
        self.subLabel_2.frame = CGRectMake(79, 57.5, kScreenWidth - self.mainImageView.maxX, 20);
        self.subLabel_2.font = [UIFont systemFontOfSize:15];
        self.subLabel_2.textColor = RGBCOLOR(127, 127, 127);
        
        //分割线视图
        self.bottomView = [RKShadowView seperatorLineWithHeight:10 top:0];
        [self.bottomView setMinY:86];
    }
    return self;
}

- (void)setModel:(PersonModel*)model{
    _model = model;
    
    [self.mainImageView sd_setImageWithURL:model.a_avatarUrl placeholderImage:nil];
    self.mainLabel.text = model.a_name;
    self.subLabel_1.text = model.a_companyName;
    self.subLabel_2.text = model.a_duties;
}
@end
