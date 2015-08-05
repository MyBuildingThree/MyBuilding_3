//
//  RegisterVCViewController.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RegisterVC.h"
#import "ShowView.h"
#import "LoginApi.h"
#import "MD5.h"

#define textRatio (((UIView *)[UIApplication sharedApplication].delegate.window).bounds.size.width)

@interface RegisterVC ()

//返回按钮
@property (nonatomic,strong)UIButton *backBtn;

//用户名输入框
@property (nonatomic,strong)UITextField *userNameTF;
//密码输入框
@property (nonatomic,strong)UITextField *passwordTF;
//重复密码输入框
@property (nonatomic,strong)UITextField *password2TF;
//注册按钮
@property (nonatomic,strong)UIButton *registerBtn;

@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"注册";
    
    [self createSubViews];
}

//创建当前 视图的子视图
- (void)createSubViews
{
    //绑定手机提示文字
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.05, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    numberLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.05f];
    numberLabel.textAlignment = NSTextAlignmentLeft;
    //picLabel.textColor = [UIColor lightGrayColor];
    numberLabel.text = @"不用输入了,没必要";
    [self.view addSubview:numberLabel];
    //绑定手机输入框
    self.numberTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.05, self.view.frame.size.width*0.6, self.view.frame.size.height*0.05)];
    self.numberTF.backgroundColor = [UIColor whiteColor];
    self.numberTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.numberTF.layer.borderColor = [UIColor blackColor].CGColor;
    self.numberTF.layer.borderWidth = 1;
    self.numberTF.font = [UIFont systemFontOfSize:textRatio*0.04f];
    self.numberTF.placeholder = @"  不用输入了,没必要";
    [self.view addSubview:self.numberTF];
    
    
    //用户名提示文字
    UILabel *usernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.12, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    usernameLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.05f];
    usernameLabel.textAlignment = NSTextAlignmentLeft;
    //picLabel.textColor = [UIColor lightGrayColor];
    usernameLabel.text = @"用户民";
    [self.view addSubview:usernameLabel];
    //用户名输入框
    self.userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.12, self.view.frame.size.width*0.5, self.view.frame.size.height*0.05)];
    self.userNameTF.backgroundColor = [UIColor whiteColor];
    self.userNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userNameTF.layer.borderColor = [UIColor blackColor].CGColor;
    self.userNameTF.layer.borderWidth = 1;
    self.userNameTF.placeholder = @"  仅支持汉字,数字和字母";
    self.userNameTF.font = [UIFont systemFontOfSize:textRatio*0.04f];
    [self.view addSubview:self.userNameTF];
    
    
    //密码提示文字
    UILabel *passwordLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.19, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    passwordLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.05f];
    passwordLabel.textAlignment = NSTextAlignmentLeft;
    //picLabel.textColor = [UIColor lightGrayColor];
    passwordLabel.text = @"密码";
    [self.view addSubview:passwordLabel];
    //密码输入框
    self.passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.19, self.view.frame.size.width*0.6, self.view.frame.size.height*0.05)];
    self.passwordTF.backgroundColor = [UIColor whiteColor];
    self.passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTF.layer.borderColor = [UIColor blackColor].CGColor;
    self.passwordTF.layer.borderWidth = 1;
    self.passwordTF.font = [UIFont systemFontOfSize:textRatio*0.04f];
    self.passwordTF.placeholder = @"  仅支持数字和字母";
    [self.view addSubview:self.passwordTF];
    
    //重复密码提示文字
    UILabel *password2Label = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.26, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    password2Label.font = [UIFont boldSystemFontOfSize:textRatio*0.05f];
    password2Label.textAlignment = NSTextAlignmentLeft;
    //picLabel.textColor = [UIColor lightGrayColor];
    password2Label.text = @"重复密码";
    [self.view addSubview:password2Label];
    //密码输入框
    self.password2TF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.26, self.view.frame.size.width*0.6, self.view.frame.size.height*0.05)];
    self.password2TF.backgroundColor = [UIColor whiteColor];
    self.password2TF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.password2TF.layer.borderColor = [UIColor blackColor].CGColor;
    self.password2TF.layer.borderWidth = 1;
    self.password2TF.font = [UIFont systemFontOfSize:textRatio*0.04f];
    self.password2TF.placeholder = @"  仅支持数字和字母";
    [self.view addSubview:self.password2TF];
    
    //完成按钮
    self.registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.35, self.view.frame.size.height*0.32, self.view.frame.size.width*0.3, self.view.frame.size.height*0.05)];
    self.registerBtn.backgroundColor = [UIColor whiteColor];
    self.registerBtn.layer.cornerRadius = 2;
    self.registerBtn.layer.masksToBounds = YES;
    self.registerBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.registerBtn.layer.borderWidth = 1;
    [self.registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.registerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.registerBtn.titleLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.05f];
    [self.registerBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerBtn];
}

- (void)btnClick:(UIButton *)btn
{
    if (self.userNameTF.text.length == 0 || self.passwordTF.text.length == 0 || self.password2TF.text.length == 0 ) {
        [ShowView showAtFrame:CGRectMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.5, self.view.bounds.size.width*0.6, 50) backgroundColor:[UIColor blackColor] title:@"不能有空" titleColor:[UIColor whiteColor] titleFontOfSize:18.0f animateWithDuration:2.0f completion:^{}];
    }
    if ([btn.titleLabel.text isEqualToString:@"注册"])
    {
        if (self.userNameTF.text.length == 0 || self.passwordTF.text.length == 0 || self.password2TF.text.length == 0 ) {
            [ShowView showAtFrame:CGRectMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.5, self.view.bounds.size.width*0.6, 50) backgroundColor:[UIColor blackColor] title:@"不能有空" titleColor:[UIColor whiteColor] titleFontOfSize:18.0f animateWithDuration:2.0f completion:^{}];
        }
        //两次密码输入不正确
       else if (![self.passwordTF.text isEqualToString:self.password2TF.text])
        {
            [ShowView showAtFrame:CGRectMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.5, self.view.bounds.size.width*0.6, 50) backgroundColor:[UIColor blackColor] title:@"两次密码输入不正确" titleColor:[UIColor whiteColor] titleFontOfSize:18.0f animateWithDuration:2.0f completion:^{}];
        }
        else
        {
//            cellPhone 注册的手机号码，
//            *                   password  注册密码 md5加密，
//            *                   deviceType 登录设备，05表示手机端，
//            *                   barCode   验证码，
//            *                   username  注册的用户名，
//            *                   token     ios推送口令牌，
//            *                   downloadType ios设备登录证书区分，01是99正式，02是299证书
            //上传的字典
            NSDictionary *dict = @{@"downloadType":@"02",@"deviceType":@"05",@"password":[MD5 md5HexDigest:self.passwordTF.text],@"username":self.userNameTF.text,@"token":@"",@"barCode":@"1234",@"cellPhone":@"12345678907"};
            [LoginApi RegisterWithBlock:^(LoginModel *loginModel, NSError *error) {
                if (!error)
                {
                    [ShowView showAtFrame:CGRectMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.5, self.view.bounds.size.width*0.6, 50) backgroundColor:[UIColor blackColor] title:@"Temp注册成功" titleColor:[UIColor whiteColor] titleFontOfSize:18.0f animateWithDuration:2.0f completion:^{
                        [self.navigationController dismissViewControllerAnimated:YES completion:^{}];
                    }];
                }
            } dic:(NSMutableDictionary *)dict noNetWork:^{}];
        }
    }
}

@end
