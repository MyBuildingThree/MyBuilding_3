//
//  ProjectDataInfoView2.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectDataInfoView2.h"
#import "RKLabelLabel.h"
#import "UIView+ViewKit.h"
#import "RKShadowView.h"

@interface ProjectDataInfoView2 ()

@property(nonatomic, strong) RKLabelLabel* labelLabel00;

@property(nonatomic, strong) RKLabelLabel* labelLabel01;

@property(nonatomic, strong) RKLabelLabel* labelLabel02;

@property(nonatomic, strong) RKLabelLabel* labelLabel03;

@property(nonatomic, strong) RKLabelLabel* labelLabel04;

@property(nonatomic, strong) RKLabelLabel* labelLabel05;

@property(nonatomic, strong) RKLabelLabel* labelLabel06;

@property(nonatomic, strong) RKLabelLabel* labelLabel07;

//@property(nonatomic, strong) RKLabelLabel* labelLabel08;

@property(nonatomic, strong) RKLabelLabel* labelLabel09;

@property(nonatomic, strong) RKLabelLabel* labelLabel10;

@property(nonatomic, strong) RKLabelLabel* labelLabel11;

@property(nonatomic, strong) RKLabelLabel* labelLabel12;

@property(nonatomic, strong) RKLabelLabel* labelLabel13;

@property(nonatomic, strong) RKLabelLabel* labelLabel14;

@property(nonatomic, strong) NSArray* labelArr;

@property(nonatomic, strong) UIView* sepe1;

@property(nonatomic, strong) UIView* sepe2;

@end

@implementation ProjectDataInfoView2

- (void)refreshViews{
    CGFloat const topMargin = 10;
    CGFloat const eachArrangeW = 50;
    __block NSArray* arrangeHArr = @[@10, @(153.0 / 375 * kScreenWidth), @(kScreenWidth - 83)];
    
#warning 这边要进行处理，最后确认样式，是普通布局还是什么
    self.backgroundColor = [[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:.5];
    
    NSArray* normalLabelArr = self.labelArr;
    [normalLabelArr enumerateObjectsUsingBlock:^(RKLabelLabel* labelLabel, NSUInteger idx, BOOL *stop) {
        CGFloat originX = [arrangeHArr[idx % 3] doubleValue];
        CGFloat originY = topMargin + eachArrangeW * (idx / 3);
        labelLabel.origin = CGPointMake(originX , originY);
    }];
    
    UIView* laseLabel = normalLabelArr.lastObject;
    self.size = CGSizeMake(kScreenWidth, laseLabel.maxY + topMargin);
    
    //设置分割线
    self.sepe1.midY = (self.labelLabel06.maxY + self.labelLabel09.minY) * 0.5;
    self.sepe2.midY = (self.labelLabel11.maxY + self.labelLabel12.minY) * 0.5;

}

- (void)setProjectDataInfoViewContents:(NSArray *)contents{
    [contents enumerateObjectsUsingBlock:^(NSString* content, NSUInteger idx, BOOL *stop) {
        RKLabelLabel* labelLabel = self.labelArr[idx];
        BOOL isNothing = [content isEqualToString:@""];
        labelLabel.firstLabel.text = isNothing ? @"暂无数据" : content;
        labelLabel.firstLabel.textColor = isNothing ? RGBCOLOR(127, 127, 127) : RGBCOLOR(22, 119, 203);
    }];
    [self refreshViews];
}

- (RKLabelLabel *)getRKLabelWithTitle:(NSString *)title{
    RKLabelLabel* labelLabel = [RKLabelLabel labelLabelWithHeight:37];
    labelLabel.secondLabel.text = title;
    labelLabel.secondLabel.textColor = RGBCOLOR(127, 127, 127);
    labelLabel.secondLabel.font = [UIFont systemFontOfSize:14];
    labelLabel.firstLabel.font = [UIFont systemFontOfSize:17];
    
    [self addSubview:labelLabel];
    return labelLabel;
}

- (UIView *)sepe1{
    if (!_sepe1) {
        _sepe1 = [RKShadowView seperatorLine];
        [self addSubview:_sepe1];
    }
    return _sepe1;
}

- (UIView *)sepe2{
    if (!_sepe2) {
        _sepe2 = [RKShadowView seperatorLine];
        [self addSubview:_sepe2];
    }
    return _sepe2;
}

- (NSArray *)labelArr{
    if (!_labelArr) {
        _labelArr = @[self.labelLabel00,self.labelLabel01,self.labelLabel02,self.labelLabel03,self.labelLabel04,self.labelLabel05,self.labelLabel06,self.labelLabel07,/*self.labelLabel08,*/self.labelLabel09,self.labelLabel10,self.labelLabel11,self.labelLabel12,self.labelLabel13,self.labelLabel14];
    }
    return _labelArr;
}

- (RKLabelLabel *)labelLabel00{
    if (!_labelLabel00) {
        _labelLabel00 = [self getRKLabelWithTitle:@"预计开工"];
    }
    return _labelLabel00;
}

- (RKLabelLabel *)labelLabel01{
    if (!_labelLabel01) {
        _labelLabel01 = [self getRKLabelWithTitle:@"预计竣工"];
    }
    return _labelLabel01;
}

- (RKLabelLabel *)labelLabel02{
    if (!_labelLabel02) {
        _labelLabel02 = [self getRKLabelWithTitle:@"电梯"];
    }
    return _labelLabel02;
}

- (RKLabelLabel *)labelLabel03{
    if (!_labelLabel03) {
        _labelLabel03 = [self getRKLabelWithTitle:@"主体设计阶段"];
    }
    return _labelLabel03;
}

- (RKLabelLabel *)labelLabel04{
    if (!_labelLabel04) {
        _labelLabel04 = [self getRKLabelWithTitle:@"钢结构"];
    }
    return _labelLabel04;
}

- (RKLabelLabel *)labelLabel05{
    if (!_labelLabel05) {
        _labelLabel05 = [self getRKLabelWithTitle:@"空调"];
    }
    return _labelLabel05;
}

- (RKLabelLabel *)labelLabel06{
    if (!_labelLabel06) {
        _labelLabel06 = [self getRKLabelWithTitle:@"供暖方式"];
    }
    return _labelLabel06;
}

- (RKLabelLabel *)labelLabel07{
    if (!_labelLabel07) {
        _labelLabel07 = [self getRKLabelWithTitle:@"外墙材料"];
    }
    return _labelLabel07;
}

//- (RKLabelLabel *)labelLabel08{
//    if (!_labelLabel08) {
//        _labelLabel08 = [self getRKLabelWithTitle:@"外资参与"];
//    }
//    return _labelLabel08;
//}

- (RKLabelLabel *)labelLabel09{
    if (!_labelLabel09) {
        _labelLabel09 = [self getRKLabelWithTitle:@"实际开工时间"];
    }
    return _labelLabel09;
}

- (RKLabelLabel *)labelLabel10{
    if (!_labelLabel10) {
        _labelLabel10 = [self getRKLabelWithTitle:@"消防"];
    }
    return _labelLabel10;
}

- (RKLabelLabel *)labelLabel11{
    if (!_labelLabel11) {
        _labelLabel11 = [self getRKLabelWithTitle:@"绿化"];
    }
    return _labelLabel11;
}

- (RKLabelLabel *)labelLabel12{
    if (!_labelLabel12) {
        _labelLabel12 = [self getRKLabelWithTitle:@"弱电安装"];
    }
    return _labelLabel12;
}

- (RKLabelLabel *)labelLabel13{
    if (!_labelLabel13) {
        _labelLabel13 = [self getRKLabelWithTitle:@"装修情况"];
    }
    return _labelLabel13;
}

- (RKLabelLabel *)labelLabel14{
    if (!_labelLabel14) {
        _labelLabel14 = [self getRKLabelWithTitle:@"装修进度"];
    }
    return _labelLabel14;
}
@end
