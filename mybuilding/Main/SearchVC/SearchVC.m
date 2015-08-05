//
//  SearchVC.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "SearchVC.h"
#import "SearchSqlite.h"
#import "PopoverView.h"
//人
#import "PersonApi.h"
#import "PersonModel.h"
#import "MainContactCell.h"
//公司
#import "CompanyApi.h"
#import "CompanyModel.h"
#import "CompanyTableViewCell.h"

//判断当前搜索分类状态
static int i = -1;

@interface SearchVC ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

//搜索框
@property (nonatomic,strong)UITextField *searchTf;
//取消按钮
@property (nonatomic,strong)UIButton *backBtn;
//分类按钮
@property (nonatomic,strong)UIButton *classBtn;
//滚动视图
@property (nonatomic,strong)UITableView *tbv;
//历史数组
@property (nonatomic,strong)NSArray *array;

@end

@implementation SearchVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createSubViews];
    [self changeWithClass];
}

- (void)createSubViews
{
    self.searchTf = [[UITextField alloc]initWithFrame:CGRectMake(0, 5, 290, 39)];
    self.searchTf.delegate = self;
    self.searchTf.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.searchTf.enablesReturnKeyAutomatically = YES;
    //self.searchTf.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.searchTf.leftViewMode = UITextFieldViewModeAlways;
    self.searchTf.returnKeyType = UIReturnKeySearch;
    self.searchTf.borderStyle = UITextBorderStyleRoundedRect;
    //self.searchTf.layer.borderWidth = 1;
    //self.searchTf.layer.masksToBounds = YES;
    //self.searchTf.layer.cornerRadius = 2;
    self.searchTf.placeholder = @"请输入搜索的关键词";
    
    self.classBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 34)];
    [self.classBtn setTitle:@"用户" forState:UIControlStateNormal];
    [self.classBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.classBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.searchTf.leftView = self.classBtn;
    
    self.backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 34)];
    [self.backBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.backBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.searchTf];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];

    
    self.tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tbv.dataSource = self;
    self.tbv.delegate = self;
    
}

//根据分类显示不同的历史
- (void)changeWithClass
{
    //查询数据
    self.array = [SearchSqlite openSqlWithClass:self.classBtn.titleLabel.text];
    if (self.array.count == 0)
    {
        [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 300, 50)];
        label.backgroundColor = [UIColor lightGrayColor];
        label.text = @"没有历史记录";
        [self.view addSubview:label];
    }
    else
    {
        [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
        [self.view addSubview:self.tbv];
        if (i == -1)
        {
            self.tbv.sectionFooterHeight = 44;
        }
        [self.tbv reloadData];
    }

}

//根据分类显示不同的结果
- (void)searchWithClass
{
    if (self.array.count == 0)
    {
        [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 300, 50)];
        label.backgroundColor = [UIColor lightGrayColor];
        label.text = @"没有搜索结果0.0";
        [self.view addSubview:label];
    }
    else
    {
        [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
        [self.view addSubview:self.tbv];
        self.tbv.sectionFooterHeight = 0;
        [self.tbv reloadData];
    }
    
}


- (void)btnClick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"清除记录"])
    {
        [SearchSqlite deleteDataWith:self.classBtn.titleLabel.text];
        [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
        [self changeWithClass];
    }
    else if ([btn.titleLabel.text isEqualToString:@"取消"])
    {
        [self.navigationController popViewControllerAnimated: YES];
    }
    else if (btn == self.classBtn)
    {
        CGRect rc = [self.searchTf convertRect:self.searchTf.leftView.frame toView:[UIApplication sharedApplication].keyWindow];
        NSArray *array = @[@"用户",@"公司",@"项目",@"丫丫"];
        CGPoint point = CGPointMake(rc.origin.x + rc.size.width/2, rc.origin.y + rc.size.height);
        [PopoverView popUpWithPoint:point titles:array images:nil scroller:NO selectTodo:^(NSInteger index) {
            [self.classBtn setTitle:array[index] forState:UIControlStateNormal];
            self.searchTf.text =@"";
            [self changeWithClass];
        }];
    }
}

//UITextField协议
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchTf resignFirstResponder];
    [SearchSqlite addDataWith:self.classBtn.titleLabel.text content:self.searchTf.text];
    
    //搜人
    if ([self.classBtn.titleLabel.text isEqualToString:@"用户"])
    {
        [PersonApi SearchUserWithBlock:^(NSMutableArray *posts, NSError *error) {
            NSLog(@"%@",self.array);
            self.array = posts;
            NSLog(@"%@",self.array);
            i = 0;
            [self.tbv reloadData];
            
        } keywords:self.searchTf.text startIndex:0 noNetWork:^{}];
    }
    //搜公司
    else if ([self.classBtn.titleLabel.text isEqualToString:@"公司"])
    {
        [CompanyApi GetCompanyListWithBlock:^(NSMutableArray *posts, NSError *error) {
            NSLog(@"%@",posts);
            self.array = posts;
            i = 1;
            [self.tbv reloadData];
        } startIndex:0 keyWords:self.searchTf.text noNetWork:^{}];
    }

    return  YES;
}

//UITableView协议
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (i == -1)
    {
        return 44.0f;
    }
    else //if (i == 0)
    {
        return [MainContactCell carculateHeightWithModel:nil];
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (i == -1)
    {
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = [UIColor whiteColor];
        UIButton *clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 10, 150, 30)];
        clearBtn.backgroundColor = [UIColor lightGrayColor];
        [clearBtn setTitle:@"清除记录" forState:UIControlStateNormal];
        [clearBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:clearBtn];
        return view;
    }
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (i == -1)//历史
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Histroy"];
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Histroy"];
        }
        cell.textLabel.text = self.array[self.array.count-1-indexPath.row];
        return cell;
    }
    else  if (i == 0)//人
    {
        MainContactCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Person"];
        if (!cell)
        {
            cell = [[MainContactCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Person"];
        }
        cell.model = self.array[indexPath.row];
        return cell;
    }
    else  //if (i == 1)//人
    {
        CompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Company"];
        if (!cell)
        {
            cell = [[CompanyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Company"];
        }
        cell.model = self.array[indexPath.row];
        return cell;
    }

    
}

- (void)dealloc{
    NSLog(@"22");
}
@end
