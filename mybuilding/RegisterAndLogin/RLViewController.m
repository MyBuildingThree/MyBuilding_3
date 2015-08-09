//
//  RLViewController.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RLViewController.h"
#import "UIView+ViewKit.h"

@interface RLViewController ()

//背景视图
@property (nonatomic, strong)UIView *bgView;
//注册按钮
@property (nonatomic, strong)UIButton *regisiterBtn;

@end

@interface RLViewController ()

@end

@implementation RLViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addSubViews];
}

- (void)addSubViews
{
    //背景
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bgView];
    
    //锁
    UIImageView *lockImage= [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth-45)*0.5, 18+64, 45, 75)];
    lockImage.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lockImage];
    
    //注册说明
    UILabel *label0 = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth-170)*0.5, (kScreenHeight-64)*0.167+64, 170, 45)];
    label0.numberOfLines = 0;
    label0.textAlignment = NSTextAlignmentCenter;
    label0.text = @"此处操作需要注册用户才能进一步操作";
    [self.view addSubview:label0];
    
    //注册按钮
    self.regisiterBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, (kScreenHeight-64)*0.27+64, kScreenWidth, 55)];
    self.regisiterBtn.backgroundColor = RGBCOLOR(28, 87, 255);
    [self.regisiterBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:self.regisiterBtn];
}



@end
