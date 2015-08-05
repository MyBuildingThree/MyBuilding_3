//
//  ResetVC.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ResetVC.h"
#import "ShowView.h"
#import "MD5.h"
#import "LoginApi.h"

#define textRatio (((UIView *)[UIApplication sharedApplication].delegate.window).bounds.size.width)

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
    passwordLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.05f];
    passwordLabel.textAlignment = NSTextAlignmentLeft;
    //picLabel.textColor = [UIColor lightGrayColor];
    passwordLabel.text = @"密码";
    [self.view addSubview:passwordLabel];
    //密码输入框
    self.passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.05, self.view.frame.size.width*0.5, self.view.frame.size.height*0.05)];
    self.passwordTF.backgroundColor = [UIColor whiteColor];
    self.passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTF.layer.borderColor = [UIColor blackColor].CGColor;
    self.passwordTF.layer.borderWidth = 1;
    self.passwordTF.font = [UIFont systemFontOfSize:textRatio*0.04f];
    self.passwordTF.placeholder = @"  仅支持数字和字母";
    [self.view addSubview:self.passwordTF];
    
    
    //重置提示文字
    UILabel *resetLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.12, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    resetLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.05f];
    resetLabel.textAlignment = NSTextAlignmentLeft;
    //picLabel.textColor = [UIColor lightGrayColor];
    resetLabel.text = @"重复密码";
    [self.view addSubview:resetLabel];
    //重置密码输入框
    self.repetitionTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.12, self.view.frame.size.width*0.5, self.view.frame.size.height*0.05)];
    self.repetitionTF.backgroundColor = [UIColor whiteColor];
    self.repetitionTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.repetitionTF.layer.borderColor = [UIColor blackColor].CGColor;
    self.repetitionTF.layer.borderWidth = 1;
    self.repetitionTF.placeholder = @"  仅支持数字和字母";
    self.repetitionTF.font = [UIFont systemFontOfSize:textRatio*0.04f];
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
    self.okBtn.titleLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.05f];
    [self.okBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.okBtn];
}

- (void)btnClick:(UIButton *)btn
{
    if (self.passwordTF.text.length == 0 || self.repetitionTF.text.length == 0) {
        [ShowView showAtFrame:CGRectMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.5, self.view.bounds.size.width*0.6, 50) backgroundColor:[UIColor blackColor] title:@"不能有空" titleColor:[UIColor whiteColor] titleFontOfSize:18.0f animateWithDuration:2.0f completion:^{}];
    }
            //两次密码输入不正确
        else if (![self.passwordTF.text isEqualToString:self.repetitionTF.text])
        {
            [ShowView showAtFrame:CGRectMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.5, self.view.bounds.size.width*0.6, 50) backgroundColor:[UIColor blackColor] title:@"两次密码输入不正确" titleColor:[UIColor whiteColor] titleFontOfSize:18.0f animateWithDuration:2.0f completion:^{}];
        }
        else
        {
            /**
             *  忘记密码重新设置新密码 post
             *
             *  @param block     回调给页面的数据
             *  @param dic       传递给服务器的数据
             *                   barCode 验证码
             *                   password 新密码
             *                   cellPhone 手机号码
             *  @param noNetWork 是否网络连接
             */
            //上传的字典
            NSDictionary *dict = @{@"barCode":@"1234",@"password":[MD5 md5HexDigest:self.passwordTF.text],@"cellPhone":@"12345678909"};
            
            [LoginApi FindPasswordWithBlock:^(NSMutableArray *posts, NSError *error) {
                if (!error)
                {
                    [ShowView showAtFrame:CGRectMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.5, self.view.bounds.size.width*0.6, 50) backgroundColor:[UIColor blackColor] title:@"Temp成功" titleColor:[UIColor whiteColor] titleFontOfSize:18.0f animateWithDuration:2.0f completion:^{
                        [self.navigationController dismissViewControllerAnimated:YES completion:^{}];
                    }];
                }

            } dic:dict noNetWork:^{}];
        }
    
}

@end
