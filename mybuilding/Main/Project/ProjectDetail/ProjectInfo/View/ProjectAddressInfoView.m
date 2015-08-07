//
//  ProjectAddressInfoView.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectAddressInfoView.h"
#import "UIView+ViewKit.h"
#import "UILabel+LabelKit.h"

@interface ProjectAddressInfoView ()

/**
 *  背景
 */
@property(nonatomic, strong) UIImageView* bgImgView;

@property(nonatomic, strong) UIView* centerView;

/**
 *  当中的label
 */
@property(nonatomic, strong) UILabel* mainLabel;

@end

@implementation ProjectAddressInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.bgImgView.center = self.internalCenter;
    }
    return self;
}

- (void)setContent:(NSString *)content{
    self.mainLabel.text = content;
}

- (UILabel *)mainLabel{
    if (!_mainLabel) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width - 45 * 2, self.height - 23 * 2)];
        label.backgroundColor = [[UIColor alloc] initWithWhite:1 alpha:.8];
        label.layer.borderWidth = 1;
        label.layer.borderColor = [UIColor grayColor].CGColor;
        label.center = self.internalCenter;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
        label.numberOfLines = 0;
        label.textColor = RGBCOLOR(51, 51, 51);
        [self addSubview:label];
        
        _mainLabel = label;
    }
    return _mainLabel;
}

- (UIImageView *)bgImgView{
    if (!_bgImgView) {
        UIImageView* imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        imgView.backgroundColor = [[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:.5];
        [self addSubview:imgView];
        
        _bgImgView = imgView;
    }
    return _bgImgView;
}

@end
