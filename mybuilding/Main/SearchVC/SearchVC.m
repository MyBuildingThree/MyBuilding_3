//
//  SearchVC.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "SearchVC.h"
#import "SearchSqlite.h"

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
    self.searchTf.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.searchTf.leftViewMode = UITextFieldViewModeAlways;
    self.searchTf.returnKeyType = UIReturnKeySearch;
    self.searchTf.layer.borderWidth = 1;
    self.searchTf.layer.masksToBounds = YES;
    self.searchTf.layer.cornerRadius = 2;
    self.searchTf.placeholder = @"请输入搜索的关键词";
    
    self.classBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 34)];
    [self.classBtn setTitle:@"用户" forState:UIControlStateNormal];
    [self.classBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.searchTf.leftView = self.classBtn;
    
    self.backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 34)];
    [self.backBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.backBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    self.tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
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
        [self.view addSubview:self.tbv];
    }
    
}

- (void)addNavigationItem
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.searchTf];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];
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

@end
