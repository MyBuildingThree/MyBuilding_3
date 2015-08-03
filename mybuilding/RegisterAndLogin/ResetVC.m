//
//  ResetVC.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ResetVC.h"

@interface ResetVC ()

//密码输入框
@property (nonatomic,strong)UITextField *passwordTF;
//重复密码输入框
@property (nonatomic,strong)UITextField *repetitionTF;
//重复密码输入框
@property (nonatomic,strong)UIButton *okBtn;


@end

@implementation ResetVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"重置密码";
    
    [self createSubViews];
}

//创建当前 视图的子视图
- (void)createSubViews
{
    //密码提示文字
    UILabel *passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.05, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    passwordLabel.font = [UIFont systemFontOfSize:15.0f];
    passwordLabel.textAlignment = NSTextAlignmentLeft;
    //picLabel.textColor = [UIColor lightGrayColor];
    passwordLabel.text = @"密码";
    [self.view addSubview:passwordLabel];
    //密码输入框
    self.passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.05, self.view.frame.size.width*0.4, self.view.frame.size.height*0.05)];
    self.passwordTF.backgroundColor = [UIColor whiteColor];
    self.passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTF.layer.borderColor = [UIColor blackColor].CGColor;
    self.passwordTF.layer.borderWidth = 1;
    self.passwordTF.placeholder = @"仅支持数字和字母";
    [self.view addSubview:self.passwordTF];
    
    
    //重置提示文字
    UILabel *resetLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.12, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    resetLabel.font = [UIFont systemFontOfSize:15.0f];
    resetLabel.textAlignment = NSTextAlignmentLeft;
    //picLabel.textColor = [UIColor lightGrayColor];
    resetLabel.text = @"重置密码";
    [self.view addSubview:resetLabel];
    //重置密码输入框
    self.repetitionTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.12, self.view.frame.size.width*0.4, self.view.frame.size.height*0.05)];
    self.repetitionTF.backgroundColor = [UIColor whiteColor];
    self.repetitionTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.repetitionTF.layer.borderColor = [UIColor blackColor].CGColor;
    self.repetitionTF.layer.borderWidth = 1;
    self.repetitionTF.placeholder = @"仅支持数字和字母";
    [self.view addSubview:self.repetitionTF];
    
    //完成按钮
    self.okBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.35, self.view.frame.size.height*0.19, self.view.frame.size.width*0.3, self.view.frame.size.height*0.05)];
    self.okBtn.backgroundColor = [UIColor whiteColor];
    self.okBtn.layer.cornerRadius = 2;
    self.okBtn.layer.masksToBounds = YES;
    self.okBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.okBtn.layer.borderWidth = 1;
    [self.okBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.okBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.okBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.okBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
