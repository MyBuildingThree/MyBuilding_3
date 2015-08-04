//
//  FindPasswordVC.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "FindPasswordVC.h"
#import "ShowView.h"

#define textRatio (((UIView *)[UIApplication sharedApplication].delegate.window).bounds.size.width)

@interface FindPasswordVC ()

//图片输入框
@property (nonatomic,strong)UITextField *picTF;
//验证码图片
@property (nonatomic,strong)UIImageView *pic;
//手机号码输入框
@property (nonatomic,strong)UITextField *numberTF;
//验证码按钮
@property (nonatomic,strong)UIButton *codeBtn;
//手机验证码输入框
@property (nonatomic,strong)UITextField *codeTF;
//下一步按钮
@property (nonatomic,strong)UIButton *nextBtn;
//倒计时
@property (nonatomic,strong)NSTimer *timer;

@end

@implementation FindPasswordVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //修改导航栏元素(项)
    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    //self.navigationItem.leftBarButtonItem
    self.title = @"密码找回";
    
    [self createSubViews];
    //定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(changeTime) userInfo:nil repeats:YES];
    [self.timer setFireDate:[NSDate distantFuture]];
}

//创建当前 视图的子视图
- (void)createSubViews
{NSLog(@"%f",((UIView *)[[UIApplication sharedApplication].windows lastObject]).bounds.size.width);
    //图片验证提示文字
    UILabel *picLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.05, self.view.frame.size.height*0.05, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    picLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.045f];
    picLabel.textAlignment = NSTextAlignmentLeft;
    //picLabel.textColor = [UIColor lightGrayColor];
    picLabel.text = @"图片验证";
    [self.view addSubview:picLabel];
    //图片输入框
    self.picTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.05, self.view.frame.size.width*0.4, self.view.frame.size.height*0.05)];
    self.picTF.backgroundColor = [UIColor whiteColor];
    self.picTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.picTF.layer.borderColor = [UIColor blackColor].CGColor;
    self.picTF.layer.borderWidth = 1;
    self.picTF.placeholder = @" 请输入图片验证码";
    self.picTF.font = [UIFont systemFontOfSize:textRatio*0.04f];
    [self.view addSubview:self.picTF];
    //图片
    self.pic = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg.png"]];
    self.pic.backgroundColor = [UIColor blueColor];
    self.pic.frame = CGRectMake(self.view.frame.size.width*0.75, self.view.frame.size.height*0.05, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05);
    [self.view addSubview:self.pic];
    
    
    //手机号码提示文字
    UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.05, self.view.frame.size.height*0.12, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    numberLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.045f];
    numberLabel.textAlignment = NSTextAlignmentLeft;
    //picLabel.textColor = [UIColor lightGrayColor];
    numberLabel.text = @"手机号码";
    [self.view addSubview:numberLabel];
    //手机号码输入框
    self.numberTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.12, self.view.frame.size.width*0.4, self.view.frame.size.height*0.05)];
    self.numberTF.backgroundColor = [UIColor whiteColor];
    self.numberTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.numberTF.layer.borderColor = [UIColor blackColor].CGColor;
    self.numberTF.layer.borderWidth = 1;
    self.numberTF.placeholder = @" 请输入手机号码";
    self.numberTF.font = [UIFont systemFontOfSize:textRatio*0.04f];
    [self.view addSubview:self.numberTF];
    //验证码按钮
    self.codeBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.75, self.view.frame.size.height*0.12, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    self.codeBtn.backgroundColor = [UIColor blueColor];
    self.codeBtn.layer.cornerRadius = 2;
    self.codeBtn.layer.masksToBounds = YES;
    self.codeBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.codeBtn.layer.borderWidth = 2;
    self.codeBtn.titleLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.037f];
    [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.codeBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.codeBtn];
    
    
    //手机验证码提示文字
    UILabel *codeLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.05, self.view.frame.size.height*0.19, self.view.frame.size.width*0.2, self.view.frame.size.height*0.05)];
    codeLabel.font = [UIFont systemFontOfSize:15.0f];
    codeLabel.textAlignment = NSTextAlignmentLeft;
    codeLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.045f];
    //picLabel.textColor = [UIColor lightGrayColor];
    codeLabel.text = @"手机验证";
    [self.view addSubview:codeLabel];
    //手机验证码输入框
    self.codeTF = [[UITextField alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.19, self.view.frame.size.width*0.4, self.view.frame.size.height*0.05)];
    self.codeTF.backgroundColor = [UIColor whiteColor];
    self.codeTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.codeTF.layer.borderColor = [UIColor blackColor].CGColor;
    self.codeTF.layer.borderWidth = 1;
    self.codeTF.placeholder = @" 请输入手机验证码";
    self.codeTF.font = [UIFont systemFontOfSize:textRatio*0.04f];
    [self.view addSubview:self.codeTF];
    
    
    //下一步按钮
    self.nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*0.3, self.view.frame.size.height*0.26, self.view.frame.size.width*0.4, self.view.frame.size.height*0.05)];
    self.nextBtn.backgroundColor = [UIColor whiteColor];
    self.nextBtn.layer.cornerRadius = 2;
    self.nextBtn.layer.masksToBounds = YES;
    self.nextBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.nextBtn.layer.borderWidth = 1;
    [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    self.nextBtn.titleLabel.font = [UIFont boldSystemFontOfSize:textRatio*0.05f];
    [self.nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.nextBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextBtn];
}

//按钮点击事件
- (void)btnClick:(UIButton *)btn
{
    //点击获取验证码
    if (btn == self.codeBtn)
    {
        //空
        if (self.picTF.text.length == 0||self.numberTF.text.length == 0)
        {
            [ShowView showAtFrame:CGRectMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.5, self.view.bounds.size.width*0.6, 50) backgroundColor:[UIColor blackColor] title:@"请输入手机号/图片验证码" titleColor:[UIColor whiteColor] titleFontOfSize:18.0f animateWithDuration:2.0f completion:^{}];
        }
        //倒计时
        else
        {
            self.codeBtn.selected = YES;
            [self.timer setFireDate:[NSDate distantPast]];
        }
        
    }
}

-(void)changeTime
{
    static int i = 59;
    [self.codeBtn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateSelected];
    i--;
    if (i<0) {
        [self.timer setFireDate:[NSDate distantFuture]];
        i = 59;
        self.codeBtn.selected = NO;
    }
    
}

//取消第一响应者
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.picTF resignFirstResponder];
    [self.numberTF resignFirstResponder];
    [self.codeTF resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
