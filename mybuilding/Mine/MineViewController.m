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
#import "MyInfoCell.h"
#import "MyIntegralCell.h"
#import "TemplateCell.h"
#import "OtherCell.h"


@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>

//tableview
@property (nonatomic,strong)UITableView *tbv;
//人模型
@property (nonatomic,strong)PersonModel *personModel;

@end

@implementation MineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.personModel = [[PersonModel alloc]init];
    
    [self addRightBarButtonItems];
    [self addTableView];
    
    //获取数据
    [self loadPersonInfo];
    
}

//导航栏的items
- (void)addRightBarButtonItems
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

//tableView
- (void)addTableView
{
    self.tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49) style:UITableViewStylePlain];
    self.tbv.delegate = self;
    self.tbv.dataSource = self;
    self.tbv.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tbv];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row)
    {
        case 0:
            return 106.f;
        case 1:
            return 152.f;
        case 2:
        case 3:
            return 118.f;
        default:
            return 266.f;
            
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
       switch (indexPath.row)
    {
        case 0://人
        {
            MyInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyInfo"];
            if (!cell)
            {
                cell = [[MyInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyInfo"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.personModel = self.personModel;
            
            return cell;
        }
        case 1://积分
        {
            MyIntegralCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIntegral"];
            if (!cell)
            {
                cell = [[MyIntegralCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyIntegral"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.personModel = self.personModel;
            return cell;
        }
        case 2://合同
        {
            TemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Template"];
            if (!cell)
            {
                cell = [[TemplateCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Template"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }

            
            NSMutableArray *array0 = [NSMutableArray arrayWithObjects:[self setZeroWithStr: self.personModel.a_contractNum_begin],[self setZeroWithStr: self.personModel.a_contractNum_end],[self setZeroWithStr: self.personModel.a_contractNum_close], nil];
            NSMutableArray *array1 =  [NSMutableArray arrayWithObjects:@"进行中",@"已完成",@"已关闭", nil];
            
            [cell setSubviewsWithNum:array0 textArray:array1 title:@"我的全部合同"];
            
            return cell;
        }
        case 3:
        {
            TemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Template2"];
            if (!cell)
            {
                cell = [[TemplateCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Template2"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            NSMutableArray *array00 = [NSMutableArray arrayWithObjects:[self setZeroWithStr: self.personModel.a_focusProjectNum],[self setZeroWithStr: self.personModel.a_focusPersonNum],[self setZeroWithStr: self.personModel.a_focusCompanyNum],[self setZeroWithStr: self.personModel.a_focusProductNum], nil];
            NSMutableArray *array11 =  [NSMutableArray arrayWithObjects:@"关注的项目",@"关注的人",@"关注的公司",@"关注的产品", nil];
            
            [cell setSubviewsWithNum:array00 textArray:array11 title:@"我的全部合同"];
            
            return cell;
        }
        default:
        {
            OtherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Other"];
            if (!cell)
            {
                cell = [[OtherCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Other"];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.otherArray = @[@"我的询价",@"待回复询价",@"发布的项目",@"发布的动态",@"发布的产品",@"发布的需求",@"帮助"];
            
            return cell;
        }
           
    }
    
    
}

/**
 *  获取人数据
 */
-(void)loadPersonInfo{
    [PersonApi GetUserInformationWithBlock:^(PersonModel *model, NSError *error) {
        if(!error){
            self.personModel = model;
            [self.tbv reloadData];
        }
    } userId:[LoginSqlite getdata:@"userId"] noNetWork:nil];
}

-(NSString *)setZeroWithStr:(NSString *)str
{
    if (!str) {
        return @"0";
    }else{
        return str;
    }
    
}
@end
