//
//  LoginVC.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "LoginVC.h"
#import "ShowView.h"
#import "LoginApi.h"
#import "FindPasswordVC.h"

@interface LoginVC ()

//退出按钮
@property (nonatomic,strong)UIButton *backBtn;
//登陆输入框
@property (nonatomic,strong)UITextField *userNameTF;
//密码输入框
@property (nonatomic,strong)UITextField *passwordTF;
//登陆按钮
@property (nonatomic,strong)UIButton *loginBtn;
//密码按钮
@property (nonatomic,strong)UIButton *registerBtn;
//忘记密码按钮
@property (nonatomic,strong)UIButton *forgetPasswordBtn;

@end

@implementation LoginVC

+(void)loadLoginViewControllerPresentBy:(UIViewController *)vc
{
    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:[[LoginVC alloc]init]];
    nc.navigationBar.hidden = YES;
    
    [vc presentViewController:nc animated:YES completion:^{}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //创建子控件
    [self createSubViews];
    
    //监听键盘变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

//创建当前 视图的子视图
- (void)createSubViews
{
    //背景图片
    UIImageView *bgImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg.png"]];
    bgImageView.backgroundColor = [UIColor lightGrayColor];
    bgImageView.frame = self.view.bounds;
    [self.view addSubview:bgImageView];
    
    //退出按钮
    self.backBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 30, 40, 40)];
    [self.backBtn setTitle:@"X" forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.backBtn];
    
    //登陆框
    self.userNameTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.5, self.view.frame.size.width*0.8, self.view.frame.size.height*0.08)];
    self.userNameTF.backgroundColor = [UIColor whiteColor];
    self.userNameTF.layer.cornerRadius = 2;
    self.userNameTF.layer.masksToBounds = YES;
    self.userNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.userNameTF.leftViewMode = UITextFieldViewModeAlways;
    self.userNameTF.placeholder = @"用户名";
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg.png"]];
    imageView1.backgroundColor = [UIColor blueColor];
    imageView1.frame = CGRectMake(10, 10, 30, 40);

    self.userNameTF.leftView = imageView1;
    [self.view addSubview:self.userNameTF];
    
    //密码框
    self.passwordTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.58+2, self.view.frame.size.width*0.8, self.view.frame.size.height*0.08)];
    self.passwordTF.backgroundColor = [UIColor whiteColor];
    self.passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTF.secureTextEntry = YES;
    self.passwordTF.layer.cornerRadius = 2;
    self.passwordTF.layer.masksToBounds = YES;
    self.passwordTF.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTF.placeholder = @"密码";
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg.png"]];
    imageView2.backgroundColor = [UIColor blueColor];
    imageView2.frame = CGRectMake(10, 10, 30, 40);
    
    self.passwordTF.leftView = imageView2;
    [self.view addSubview:self.passwordTF];
    
    //登陆按钮
    self.loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.66+30, self.view.frame.size.width*0.8, self.view.frame.size.height*0.08)];
    self.loginBtn.backgroundColor = [UIColor redColor];
    self.loginBtn.layer.cornerRadius = 2;
    self.loginBtn.layer.masksToBounds = YES;
    [self.loginBtn setTitle:@"登  陆" forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginBtn];
    
    //注册按钮
    self.registerBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.74+30+15, self.view.frame.size.width*0.8, self.view.frame.size.height*0.08)];
    self.registerBtn.backgroundColor = [UIColor clearColor];
    self.registerBtn.layer.cornerRadius = 2;
    self.registerBtn.layer.masksToBounds = YES;
    self.registerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.registerBtn.layer.borderWidth = 2;
    [self.registerBtn setTitle:@"注  册" forState:UIControlStateNormal];
    [self.registerBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerBtn];
    
    //提示文字
    UILabel *promptLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.2, self.view.frame.size.height*0.95-15, self.view.frame.size.width*0.4, self.view.frame.size.height*0.05)];
    promptLabel.font = [UIFont systemFontOfSize:13.0f];
    promptLabel.textAlignment = NSTextAlignmentLeft;
    promptLabel.textColor = [UIColor lightGrayColor];
    promptLabel.text = @"忘记密码了吗?";
    [self.view addSubview:promptLabel];
    
    //忘记密码点击按钮
    self.forgetPasswordBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.6, self.view.frame.size.height*0.95-15, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    self.forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    self.forgetPasswordBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.forgetPasswordBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    [self.forgetPasswordBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.forgetPasswordBtn];
    

}

- (void)btnClick:(UIButton *)btn
{
    //退出
    if (btn == self.backBtn)
    {
        [self.navigationController dismissViewControllerAnimated:YES completion:^{}];
    }
    //登陆
    else if (btn == self.loginBtn)
    {
        NSString *userNameStr = self.userNameTF.text;
        NSString *passwordStr = self.passwordTF.text;
        //判断是否为空
        if ((userNameStr.length == 0)||(passwordStr.length == 0))
        {
            [ShowView showAtFrame:CGRectMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.5, self.view.bounds.size.width*0.6, 50) backgroundColor:[UIColor blackColor] title:@"请输入账号或密码" titleColor:[UIColor whiteColor] titleFontOfSize:18.0f animateWithDuration:2.0f completion:^{
                self.userNameTF.text = @"";
                self.passwordTF.text = @"";
            }];
        }
        else
        {
            NSDictionary *dict = @{@"downloadType":@"02",@"deviceType":@"05",@"password":passwordStr,@"userNameOrCellPhone":userNameStr};
            
            [LoginApi LoginWithBlock:^(LoginModel *loginModel, NSError *error) {
                
            } dic:(NSMutableDictionary *)dict noNetWork:^{
                [ShowView showAtFrame:CGRectMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.5, self.view.bounds.size.width*0.6, 50) backgroundColor:[UIColor blackColor] title:@"无网络可用" titleColor:[UIColor whiteColor] titleFontOfSize:18.0f animateWithDuration:2.0f completion:^{
                }];

            }];
        }
        
    }
    //注册
    else if (btn == self.registerBtn)
    {
        FindPasswordVC *vc = [[FindPasswordVC alloc]init];
        vc.title = @"注册";
        [self.navigationController pushViewController:vc animated:YES];
    }
    //找回密码
    else if (btn == self.forgetPasswordBtn)
    {
        FindPasswordVC *vc = [[FindPasswordVC alloc]init];
        vc.title = @"密码找回";
        [self.navigationController pushViewController:vc animated:YES];
    }
}

//弹出键盘
- (void)keyboardWillShow:(NSNotification *)notification
{
    
    // 键盘的frame
    CGRect frame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    //键盘实时y
    CGFloat keyY = frame.origin.y;
    CGFloat ch = self.loginBtn.frame.origin.y + self.loginBtn.frame.size.height - keyY + 15;
    //动画时间
    CGFloat keyDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //执行动画
    [UIView animateWithDuration:keyDuration animations:^{
        CGRect rec2 = self.loginBtn.frame;
        rec2.origin.y -= ch;
        self.loginBtn.frame = rec2;
        
        CGRect rec3 = self.passwordTF.frame;
        rec3.origin.y -= ch;
        self.passwordTF.frame = rec3;
        
        CGRect rec4 = self.userNameTF.frame;
        rec4.origin.y -= ch;
        self.userNameTF.frame = rec4;
    }];

}

//键盘消失
- (void)keyboardWillHide:(NSNotification *)notification
{
    //动画时间
    CGFloat keyDuration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    //执行动画
    [UIView animateWithDuration:keyDuration animations:^{
        
        self.loginBtn.frame = CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.66+30, self.view.frame.size.width*0.8, self.view.frame.size.height*0.08);
        
        self.passwordTF.frame = CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.58+2, self.view.frame.size.width*0.8, self.view.frame.size.height*0.08);
        
        self.userNameTF.frame = CGRectMake(self.view.frame.size.width*0.1, self.view.frame.size.height*0.5, self.view.frame.size.width*0.8, self.view.frame.size.height*0.08);
    }];
}

//取消第一响应者
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.userNameTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
