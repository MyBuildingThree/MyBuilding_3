//
//  RLViewController.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RLViewController.h"
#import "UIView+ViewKit.h"

#define TopHeight (kScreenHeight-64)*0.36
#define BottomHeight (kScreenHeight-64)*0.64

@interface RLViewController ()

//背景视图
@property (nonatomic, strong)UIView *bgView;
//注册按钮
@property (nonatomic, strong)UIButton *regisiterBtn;
//下部分背景视图
@property (nonatomic, strong)UIView *bottomView;


//用户名输入框
@property (nonatomic,strong)UITextField *userNameTF;
//密码输入框
@property (nonatomic,strong)UITextField *passwordTF;
//记住密码
@property (nonatomic,strong)UIButton *rememberBtn;
//找回密码
@property (nonatomic,strong)UIButton *findPassWordBtn;
//登录按钮
@property (nonatomic, strong)UIButton *loginBtn;

@end

@interface RLViewController ()

@end

@implementation RLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //监听键盘变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    [self addTopSubViews];
    [self addBottomSubViews];
}

//添加上部分视图
- (void)addTopSubViews
{
    //背景
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.bgView];
    
    //锁
    UIImageView *lockImage= [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth-TopHeight*0.2)*0.5, TopHeight*0.08, TopHeight*0.2, TopHeight*0.34)];
    lockImage.backgroundColor = [UIColor blueColor];
    [self.bgView addSubview:lockImage];
    
    //注册说明
    UILabel *label0 = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth-170)*0.5, TopHeight*0.5, 170, 45)];
    label0.numberOfLines = 0;
    label0.textAlignment = NSTextAlignmentCenter;
    label0.text = @"此处操作需要注册用户才能进一步操作";
    [self.bgView addSubview:label0];
    
    //注册按钮
    self.regisiterBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, TopHeight*0.58+45, kScreenWidth, TopHeight*0.42-45)];
    self.regisiterBtn.backgroundColor = RGBCOLOR(28, 87, 255);
    [self.regisiterBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.bgView addSubview:self.regisiterBtn];
}


//添加下部分视图
- (void)addBottomSubViews
{
    //下部分背景
    self.bottomView = [[UIImageView alloc]initWithFrame:CGRectMake(0, TopHeight, kScreenWidth, BottomHeight)];
    self.bottomView.userInteractionEnabled = YES;
    self.bottomView.backgroundColor = [UIColor lightGrayColor];
    [self.bgView addSubview:self.bottomView];
    
    //说明
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth-190)*0.5, BottomHeight*0.07, 190, 21)];
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"如已经注册请登录后使用";
    [self.bottomView addSubview:label];
    
    //头像
    UIImageView *iconImage= [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth-BottomHeight*0.19)*0.5, BottomHeight*0.15+21, BottomHeight*0.19, BottomHeight*0.19)];
    iconImage.backgroundColor = [UIColor redColor];
    [self.bottomView addSubview:iconImage];
    
    //用户框
    self.userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(kScreenWidth*0.1, BottomHeight*0.42+21, kScreenWidth*0.8, 30)];
    self.userNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userNameTF.leftViewMode = UITextFieldViewModeAlways;
    self.userNameTF.textAlignment = NSTextAlignmentCenter;
    self.userNameTF.font = [UIFont systemFontOfSize:15.f];
    self.userNameTF.placeholder = @"输入用户名或手机号";
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 45, 30)];
    label1.font = [UIFont systemFontOfSize:14.f];
    label1.text = @"手机号";
    self.userNameTF.leftView = label1;
    [self.bottomView addSubview:self.userNameTF];
    UIView *line1 = [[UILabel alloc]initWithFrame:CGRectMake(0, self.userNameTF.height-0.5, self.userNameTF.width, 0.5f)];
    line1.backgroundColor = [UIColor lightGrayColor];
    [self.userNameTF addSubview:line1];
    
    
    //密码框
    self.passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(kScreenWidth*0.1, BottomHeight*0.5+51, kScreenWidth*0.8, 30)];
    self.passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTF.secureTextEntry = YES;
    self.passwordTF.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTF.textAlignment = NSTextAlignmentCenter;
    self.passwordTF.font = [UIFont systemFontOfSize:15.f];
    self.passwordTF.placeholder = @"输入账户密码";

    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 45, 30)];
    label2.font = [UIFont systemFontOfSize:14.f];
    label2.text = @"密码";
    self.passwordTF.leftView = label2;
    [self.bottomView addSubview:self.passwordTF];
    UIView *line2 = [[UILabel alloc]initWithFrame:CGRectMake(0, self.passwordTF.height-0.5, self.passwordTF.width, 0.5f)];
    line2.backgroundColor = [UIColor lightGrayColor];
    [self.passwordTF addSubview:line2];

    //记住密码按钮
    self.rememberBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth*0.1, BottomHeight*0.8, 68, 20)];
    //self.rememberBtn.backgroundColor = RGBCOLOR(28, 87, 255);
    self.rememberBtn.titleEdgeInsets = UIEdgeInsetsMake(2, 24, 2, 0);
    self.rememberBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.rememberBtn setTitle:@"记住我" forState:UIControlStateNormal];
    [self.rememberBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.bottomView addSubview:self.rememberBtn];
    //找回密码按钮
    self.findPassWordBtn = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth*0.9-60, BottomHeight*0.8, 60, 20)];
    [self.findPassWordBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    [self.findPassWordBtn setTitleColor:RGBCOLOR(22, 119, 203) forState:UIControlStateNormal];
    self.findPassWordBtn.titleEdgeInsets = UIEdgeInsetsMake(2, 4, 2, 0);
    self.findPassWordBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.bottomView addSubview:self.findPassWordBtn];
    
    //注册按钮
    self.loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, BottomHeight-TopHeight*0.42+45, kScreenWidth, TopHeight*0.42-45)];
    self.loginBtn.backgroundColor = RGBCOLOR(34, 192, 100);
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.bottomView addSubview:self.loginBtn];
}

//弹出键盘
- (void)keyboardWillShow:(NSNotification *)notification
{
    
    // 键盘的frame
    CGRect frame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //键盘实时y
    CGFloat keyY = frame.origin.y;
    CGFloat ch = self.bottomView.frame.origin.y + self.bottomView.frame.size.height+64 - keyY;
    //动画时间
    CGFloat keyDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //执行动画
    //[UIView animateWithDuration:keyDuration animations:^{
        CGRect rec = self.bottomView.frame;
        rec.origin.y -= (TopHeight + BottomHeight*0.15);
        self.bottomView.frame = rec;
    
    CGRect rec1 =  self.loginBtn.frame;
    rec1.origin.y +=(keyY - (TopHeight + BottomHeight*0.15));
    self.loginBtn.frame = rec1;
    
   // }];
    
}

@end
