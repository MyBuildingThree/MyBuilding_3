//
//  ProjectDataInfoView1.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectDataInfoView1.h"
#import "RKLabelLabel.h"
#import "UIView+ViewKit.h"

@interface ProjectDataInfoView1 ()

@property(nonatomic, strong) RKLabelLabel* labelLabel00;

@property(nonatomic, strong) RKLabelLabel* labelLabel01;

@property(nonatomic, strong) RKLabelLabel* labelLabel02;

@property(nonatomic, strong) RKLabelLabel* labelLabel03;

@property(nonatomic, strong) RKLabelLabel* labelLabel04;

@property(nonatomic, strong) RKLabelLabel* labelLabel05;

@property(nonatomic, strong) RKLabelLabel* labelLabel06;

@property(nonatomic, strong) RKLabelLabel* labelLabel07;

@property(nonatomic, strong) RKLabelLabel* labelLabel08;

@property(nonatomic, strong) RKLabelLabel* labelLabel09;

@property(nonatomic, strong) RKLabelLabel* labelLabel10;

@property(nonatomic, strong) RKLabelLabel* labelLabel11;

@property(nonatomic, strong) RKLabelLabel* labelLabel12;

@property(nonatomic, strong) RKLabelLabel* labelLabel13;

@property(nonatomic, strong) NSArray* labelArr;

@end

@implementation ProjectDataInfoView1

- (instancetype)init{
    if (self = [super init]) {

    }
    return self;
}

- (void)refreshViews{
    CGFloat const topMargin = 10;
    CGFloat const eachArrangeW = 50;
    __block NSArray* arrangeHArr = @[@10, @(153.0 / 375 * kScreenWidth), @(kScreenWidth - 83)];
    
    [self.labelArr enumerateObjectsUsingBlock:^(RKLabelLabel* labelLabel, NSUInteger idx, BOOL *stop) {
        CGFloat originX = [arrangeHArr[idx % 3] doubleValue];
        CGFloat originY = topMargin + eachArrangeW * (idx / 3);
        labelLabel.origin = CGPointMake(originX , originY);
    }];
    
    UIView* lastLabel = self.labelArr.lastObject;
    self.size = CGSizeMake(kScreenWidth, lastLabel.maxY + topMargin);
}

- (void)setProjectDataInfoViewContents:(NSArray *)contents{
    self.labelLabel00.firstLabel.text = @"12345";
    [self refreshViews];
}

- (RKLabelLabel *)getRKLabelWithTitle:(NSString *)title{
    RKLabelLabel* labelLabel = [RKLabelLabel labelLabelWithHeight:37];
    labelLabel.secondLabel.text = title;
    labelLabel.secondLabel.textColor = RGBCOLOR(127, 127, 127);
    labelLabel.secondLabel.font = [UIFont systemFontOfSize:14];
    labelLabel.firstLabel.textColor = RGBCOLOR(22, 119, 203);
    labelLabel.firstLabel.font = [UIFont systemFontOfSize:17];
    
    [self addSubview:labelLabel];
    labelLabel.backgroundColor = [[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:.5];
    
    return labelLabel;
}

- (NSArray *)labelArr{
    if (!_labelArr) {
        _labelArr = @[self.labelLabel00,self.labelLabel01,self.labelLabel02,self.labelLabel03,self.labelLabel04,self.labelLabel05,self.labelLabel06,self.labelLabel07,self.labelLabel08,self.labelLabel09,self.labelLabel10];
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
        _labelLabel02 = [self getRKLabelWithTitle:@"建筑层高"];
    }
    return _labelLabel02;
}

- (RKLabelLabel *)labelLabel03{
    if (!_labelLabel03) {
        _labelLabel03 = [self getRKLabelWithTitle:@"土地面积(平方米)"];
    }
    return _labelLabel03;
}

- (RKLabelLabel *)labelLabel04{
    if (!_labelLabel04) {
        _labelLabel04 = [self getRKLabelWithTitle:@"投资额(百万)"];
    }
    return _labelLabel04;
}

- (RKLabelLabel *)labelLabel05{
    if (!_labelLabel05) {
        _labelLabel05 = [self getRKLabelWithTitle:@"外资参与"];
    }
    return _labelLabel05;
}

- (RKLabelLabel *)labelLabel06{
    if (!_labelLabel06) {
        _labelLabel06 = [self getRKLabelWithTitle:@"土地容积率"];
    }
    return _labelLabel06;
}

- (RKLabelLabel *)labelLabel07{
    if (!_labelLabel07) {
        _labelLabel07 = [self getRKLabelWithTitle:@"建筑面积(平方米)"];
    }
    return _labelLabel07;
}

- (RKLabelLabel *)labelLabel08{
    if (!_labelLabel08) {
        _labelLabel08 = [self getRKLabelWithTitle:@"桩基基坑"];
    }
    return _labelLabel08;
}

- (RKLabelLabel *)labelLabel09{
    if (!_labelLabel09) {
        _labelLabel09 = [self getRKLabelWithTitle:@"业主类型"];
    }
    return _labelLabel09;
}

- (RKLabelLabel *)labelLabel10{
    if (!_labelLabel10) {
        _labelLabel10 = [self getRKLabelWithTitle:@"地块用途"];
    }
    return _labelLabel10;
}

@end
