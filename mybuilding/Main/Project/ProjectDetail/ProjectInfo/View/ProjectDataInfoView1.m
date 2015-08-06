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

@end

@implementation ProjectDataInfoView1
- (void)setProjectDataInfoViewContents:(NSArray *)contents{
    self.labelLabel00.firstLabel.text = @"12345";
    
    self.size = CGSizeMake(kScreenWidth, 100);
}

- (RKLabelLabel *)labelLabel00{
    if (!_labelLabel00) {
        RKLabelLabel* labelLabel = [RKLabelLabel labelLabelWithHeight:50];
        [self addSubview:labelLabel];
        labelLabel.backgroundColor = [[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:.5];
        labelLabel.secondLabel.text = @"土地面积（平方米）";
        
        _labelLabel00 = labelLabel;
    }
    return _labelLabel00;
}

//- (RKLabelLabel *)getRKLabelWith
@end
