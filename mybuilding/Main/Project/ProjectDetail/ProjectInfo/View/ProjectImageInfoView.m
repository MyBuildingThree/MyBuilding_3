//
//  ProjectImageInfoView.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectImageInfoView.h"
#import "UIView+ViewKit.h"

@interface ProjectImageInfoView ()

/**
 *  下方视图的背景
 */
@property(nonatomic, strong) UIView* bottomBgView;

/**
 *  图片数量
 */
@property(nonatomic, strong) UILabel* leftLabel;

/**
 *  查看全部
 */
@property(nonatomic, strong) UILabel* rightLabel;

@end

@implementation ProjectImageInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.clipsToBounds = YES;
        self.rightLabel.text = @"查看全部";
        self.bottomBgView.maxY = self.height;
        self.leftLabel.minX = 10;
        self.rightLabel.maxX = self.bottomBgView.width - 10;
        self.backgroundColor = [UIColor grayColor];
        self.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

- (void)setImageUrl:(NSURL *)imageUrl imageNum:(NSString *)imageNum{
    self.leftLabel.text = imageNum;
    [self sd_setImageWithURL:imageUrl placeholderImage:nil];
    
}

- (UILabel *)getLabelWithTextAlignment:(NSTextAlignment)textAlignment{
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 20)];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = textAlignment;
    return label;
}

- (UIView *)bottomBgView{
    if (!_bottomBgView) {
        UIView* bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 20)];
        bgView.backgroundColor = [[UIColor alloc] initWithRed:0 green:0 blue:0 alpha:.5];
        bgView.userInteractionEnabled = NO;
        [self addSubview:bgView];
        
        _bottomBgView = bgView;
    }
    return _bottomBgView;
}

- (UILabel *)leftLabel{
    if (!_leftLabel) {
        UILabel* label = [self getLabelWithTextAlignment:NSTextAlignmentLeft];
        [self.bottomBgView addSubview:label];
        label.minX = 10;
        
        _leftLabel = label;
    }
    return _leftLabel;
}

- (UILabel *)rightLabel{
    if (!_rightLabel) {
        UILabel* label = [self getLabelWithTextAlignment:NSTextAlignmentRight];
        [self.bottomBgView addSubview:label];
        label.maxX = self.width - 10;
        
        _rightLabel = label;
    }
    return _rightLabel;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(imageInfoViewClicked:)]) {
        [self.delegate imageInfoViewClicked:self];
    }
}

@end
