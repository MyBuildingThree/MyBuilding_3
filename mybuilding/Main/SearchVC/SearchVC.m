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
    [self addNavigationItem];
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
    
    self.tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tbv.sectionFooterHeight = 44;
    self.tbv.dataSource = self;
    self.tbv.delegate = self;
    
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
    }
    
}

- (void)addNavigationItem
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.searchTf];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
}

- (void)btnClick:(UIButton *)btn
{
    if ([btn.titleLabel.text isEqualToString:@"清除记录"])
    {
        [SearchSqlite deleteDataWith:self.classBtn.titleLabel.text];
        [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
        [self createSubViews];
    }
    else if ([btn.titleLabel.text isEqualToString:@"取消"])
    {
        [self.navigationController popViewControllerAnimated: YES];
    }
    if (btn == self.classBtn)
    {
        CGRect rc = [self.searchTf convertRect:self.searchTf.leftView.frame toView:[UIApplication sharedApplication].keyWindow];
        NSArray *array = @[@"用户",@"公司",@"项目",@"丫丫"];
        CGPoint point = CGPointMake(rc.origin.x + rc.size.width/2, rc.origin.y + rc.size.height);
        [PopoverView popUpWithPoint:point titles:array images:nil scroller:NO selectTodo:^(NSInteger index) {
            [self.classBtn setTitle:array[index] forState:UIControlStateNormal];
        }];
       

    }
}

//UITextField协议
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [SearchSqlite addDataWith:@"用户" content:self.searchTf.text];
    return  YES;
}

//UITextField协议
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = self.classBtn.titleLabel.text;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

@end
