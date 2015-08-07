//
//  MineViewController.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MineViewController.h"
#import "PersonApi.h"
#import "PersonModel.h"

@interface MineViewController ()
@property(nonatomic,strong)PersonModel *personModel;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addRightBarButtonItems];
    [self loadPersonInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//导航栏的items
-(void)addRightBarButtonItems
{
    UIButton *infBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 78, 44)];
    infBtn.titleEdgeInsets = UIEdgeInsetsMake(11.5, 0, 11.5, 0);
    [infBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [infBtn setTitle:@"消息中心" forState:UIControlStateNormal];
    UIBarButtonItem *infItem = [[UIBarButtonItem alloc]initWithCustomView:infBtn];
    
    UIButton *setBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 78, 44)];
    setBtn.titleEdgeInsets = UIEdgeInsetsMake(11.5, 0, 11.5, 0);
    [setBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [setBtn setTitle:@"帐号设置" forState:UIControlStateNormal];
    UIBarButtonItem *setItem = [[UIBarButtonItem alloc]initWithCustomView:setBtn];
    
    self.navigationItem.rightBarButtonItems = @[infItem,setItem];
}

/**
 *  获取人
 */
-(void)loadPersonInfo{
    [PersonApi GetUserInformationWithBlock:^(PersonModel *model, NSError *error) {
        if(!error){
            self.personModel = model;
            NSLog(@"===>%@",self.personModel.a_name);
        }
    } userId:[LoginSqlite getdata:@"userId"] noNetWork:nil];
}
@end
