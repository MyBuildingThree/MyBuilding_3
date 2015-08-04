//
//  MainProductCell.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MainProductCell.h"
#import "UIView+ViewKit.h"
#import "RKShadowView.h"
#import "ProductModel.h"
@implementation MainProductCell
@synthesize model = _model;
+ (CGFloat)carculateHeightWithModel:(ProductModel*)model{
    return 105;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //产品图片
        self.mainImageView.frame = CGRectMake(10, 10, 75, 75);
        self.mainImageView.backgroundColor = [UIColor grayColor];
        
        //产品名称
        self.mainLabel.frame = CGRectMake(96, 10, kScreenWidth - self.mainImageView.maxX, 20);
        self.mainLabel.font = [UIFont systemFontOfSize:17];
        self.mainLabel.textColor = RGBCOLOR(51, 51, 51);
        
        //产品详情
        self.subLabel_1.frame = CGRectMake(96, 50, kScreenWidth - self.mainImageView.maxX, 20);
        self.subLabel_1.font = [UIFont systemFontOfSize:15];
        self.subLabel_1.textColor = RGBCOLOR(127, 127, 127);
        
        //分割线视图
        self.bottomView = [RKShadowView seperatorLineWithHeight:10 top:0];
        [self.bottomView setMinY:95];
    }
    return self;
}

- (void)setModel:(ProductModel*)model{
    _model = model;
    
    [self.mainImageView sd_setImageWithURL:model.a_avatarUrl placeholderImage:nil];
    self.mainLabel.text = model.a_productName;
    self.subLabel_1.text = model.a_productDesc;
}
@end
