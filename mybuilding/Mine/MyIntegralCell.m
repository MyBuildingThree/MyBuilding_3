//
//  MyIntegralCell.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MyIntegralCell.h"
#import "RKShadowView.h"
#import "UIView+ViewKit.h"

@interface MyIntegralCell()
/**
 *  第一个标签
 */
@property (nonatomic,strong)UILabel *oneLabel;
/**
 *  积分
 */
@property (nonatomic,strong)UILabel *integralLabel;
/**
 *  签到按钮
 */
@property (nonatomic,strong)UIButton *checkBtn;
/**
 *  分割线
 */
@property (nonatomic,strong)UIView *line;
/**
 *  第二个标签
 */
@property (nonatomic,strong)UILabel *twoLabel;
/**
 *  已兑换
 */
@property (nonatomic,strong)UILabel *exchangeLabel;
/**
 *  分隔
 */
@property (nonatomic,strong)UIView *shadowView;

@end

@implementation MyIntegralCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.oneLabel = [[UILabel alloc]init];
        self.oneLabel.textColor = [UIColor lightGrayColor];
        self.oneLabel.font = [UIFont systemFontOfSize:14.f];
        self.oneLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.oneLabel];
        
        self.integralLabel = [[UILabel alloc]init];
        self.integralLabel.textColor = RGBCOLOR(242, 188, 77);
        self.integralLabel.font = [UIFont systemFontOfSize:30.f];
        self.integralLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.integralLabel];
        
        self.checkBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.checkBtn.backgroundColor = RGBCOLOR(242, 188, 77);
        [self.checkBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:self.checkBtn];
        
        
        self.line = [[UIView alloc]init];
        self.line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.line];
        
        
        self.twoLabel = [[UILabel alloc]init];
        self.twoLabel.textColor = [UIColor lightGrayColor];
        self.twoLabel.font = [UIFont systemFontOfSize:14.f];
        self.twoLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.twoLabel];
        
        self.exchangeLabel = [[UILabel alloc]init];
        self.exchangeLabel.textColor = RGBCOLOR(51, 51, 51);
        self.exchangeLabel.font = [UIFont boldSystemFontOfSize:30.f];
        self.exchangeLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:self.exchangeLabel];
        
        //
        self.shadowView = [RKShadowView seperatorLineWithHeight:10 top:0];
        [self addSubview:self.shadowView];
        
        [self set];
    }
    return self;
}

-(void)set
{
    self.oneLabel.text = @"我的积分";
    self.integralLabel.text = @"123456789";
    [self.checkBtn setTitle:@"签到" forState:UIControlStateNormal];
    self.twoLabel.text = @"兑换记录";
    self.exchangeLabel.text = @"19";
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.oneLabel.frame = CGRectMake(10.f, 10.f, 60.f, 15.f);
    self.integralLabel.frame = CGRectMake(10.f, 35.f, 200.f, 27.f);
    self.checkBtn.frame = CGRectMake(kScreenWidth-72, 35.f, 62.f, 25.f);
    self.line.frame = CGRectMake(0.f, 70.5f, kScreenWidth, 0.5f);
    self.twoLabel.frame = CGRectMake(10.f, 81.f, 60.f, 15.f);
    self.exchangeLabel.frame = CGRectMake(14.f, 106.f, 200.f, 27.f);
    self.shadowView.origin = CGPointMake(0, 142.f);
}


@end
