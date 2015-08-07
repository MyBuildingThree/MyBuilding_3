//
//  SearchVC.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "SearchVC.h"
#import "MJRefresh.h"
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
//项目
#import "ProjectApi.h"
#import "ProjectModel.h"
#import "ProjectTableViewCell.h"
//产品
#import "ProductApi.h"
#import "ProductModel.h"
#import "MainProductCell.h"

@interface SearchVC ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

//搜索框
@property (nonatomic,strong)UITextField *searchTf;
//取消按钮
@property (nonatomic,strong)UIButton *backBtn;
//分类按钮
@property (nonatomic,strong)UIButton *classBtn;
//分类数组
@property (nonatomic,strong)NSArray *classArray;
//滚动视图
@property (nonatomic,strong)UITableView *tbv;
//cell高度
@property (nonatomic,assign)CGFloat height;
//历史与结果数组
@property (nonatomic,strong)NSMutableArray *array;
//是历史记录还是搜索结果
@property (nonatomic,assign)BOOL history;
//页数
@property (nonatomic,assign)NSUInteger num;

@end

@implementation SearchVC

-(void)setHistory:(BOOL)history
{
    if (history == YES) {
        self.tbv.footer.hidden = YES;
    } else {
        self.tbv.footer.hidden = NO;
    }
    _history = history;
    
}

+ (void)searchWithClass:(NSArray *)classArray pushBy:(UINavigationController *)nc
{
    SearchVC *sv =  [[SearchVC alloc]init];
    sv.classArray = classArray;
    sv.hidesBottomBarWhenPushed = YES;
    [nc pushViewController:sv animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.history = YES;
    self.num = 0;
    [self createSubViews];
    [self changeHistoryWithClass];
}

//创建必要的控件
- (void)createSubViews
{
    //搜索框
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
    
    //分类按钮
    self.classBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 34)];
    [self.classBtn setTitle:self.classArray[0] forState:UIControlStateNormal];
    [self.classBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [self.classBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.searchTf.leftView = self.classBtn;
    
    //取消按钮
    self.backBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 34)];
    [self.backBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.backBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.backBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.searchTf];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.backBtn];

    //tableview
    self.tbv = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tbv.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tbv.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (!self.history)
        {
            self.num = 0;
            [self searchWithApiAndstartIndex:0];
            [self.tbv.header endRefreshing];
        }
    }];
    self.tbv.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        if (!self.history)
        {
            self.num++;
            [self searchWithApiAndstartIndex:self.num];
            [self.tbv reloadData];
            [self.tbv.footer endRefreshing];
        }
    }];
    

    self.tbv.dataSource = self;
    self.tbv.delegate = self;
    
}

//根据分类显示不同的历史
- (void)changeHistoryWithClass
{
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
    self.history = YES;
    //查询数据
    self.array = [SearchSqlite openSqlWithClass:self.classBtn.titleLabel.text];
    
    //没有历史
    if (self.array.count == 0)
    {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:20.f];
        label.text = @"还没有搜索记录";
        [self.view addSubview:label];
    }
    //有历史
    else
    {
        [self.view addSubview:self.tbv];
        self.tbv.sectionFooterHeight = 44;
        [self.tbv reloadData];
    }

}

//根据分类显示不同的结果
- (void)searchResult
{
    if (self.array.count == 0)
    {
        [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:20.f];
        label.text = @"没有搜索结果";
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
    //清除历史记录按钮
    if ([btn.titleLabel.text isEqualToString:@"清除历史记录"])
    {
        [SearchSqlite deleteDataWith:self.classBtn.titleLabel.text];
        [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview) withObject:nil];
        [self changeHistoryWithClass];
    }
    //取消按钮
    else if (btn == self.backBtn)
    {
        self.history = YES;
        self.num = 0;
        if(self.searchTf.text.length == 0)
        {
            [self.navigationController popViewControllerAnimated: YES];
        }
        else
        {
            self.searchTf.text = @"";
            self.history = YES;
            [self changeHistoryWithClass];
        }
    }
    //分类按钮
    else if (btn == self.classBtn)
    {
        
        CGRect rc = [self.searchTf convertRect:self.searchTf.leftView.frame toView:[UIApplication sharedApplication].keyWindow];
        
        CGPoint point = CGPointMake(rc.origin.x + rc.size.width/2, rc.origin.y + rc.size.height);
        [PopoverView popUpWithPoint:point titles:self.classArray images:nil scroller:NO selectTodo:^(NSInteger index) {
            self.searchTf.text =@"";
            [self.classBtn setTitle:self.classArray[index] forState:UIControlStateNormal];
            self.num = 0;
            [self changeHistoryWithClass];
        }];
    }
}

- (void)searchWithApiAndstartIndex:(NSUInteger)num
{
    NSUInteger index = [self.classArray indexOfObject:self.classBtn.titleLabel.text];

    switch (index)
    {
        case 0:  //用户
        {
            [PersonApi SearchUserWithBlock:^(NSMutableArray *posts, NSError *error) {
                if (num>0)
                {
                    [self.array addObjectsFromArray:posts];
                }
                else
                {
                    self.array = posts;
                }
                self.history = NO;
                [self searchResult];
            } keywords:self.searchTf.text startIndex:num noNetWork:^{}];
        }
        break;
            
        case 1:  //企业
        {
            [CompanyApi GetCompanyListWithBlock:^(NSMutableArray *posts, NSError *error) {
                if (num>0)
                {
                    [self.array addObjectsFromArray:posts];
                }
                else
                {
                    self.array = posts;
                }                self.history = NO;
                [self searchResult];
            } startIndex:num keyWords:self.searchTf.text noNetWork:^{}];
        }
        break;
            
        case 2:  //项目
        {
            [ProjectApi GetPiProjectSeachWithBlock:^(NSMutableArray *posts, NSError *error) {
                if (num>0)
                {
                    [self.array addObjectsFromArray:posts];
                }
                else
                {
                    self.array = posts;
                }
                self.history = NO;
                [self searchResult];
            } startIndex:num keywords:self.searchTf.text noNetWork:^{}];

        }
            break;
            
        default:
        {
            [ProductApi GetProductListWithBlock:^(NSMutableArray *posts, NSError *error) {
                if (num>0)
                {
                    [self.array addObjectsFromArray:posts];
                }
                else
                {
                    self.array = posts;
                }
                self.history = NO;
                [self searchResult];
            } startIndex:num productDesc:self.searchTf.text userId:@"" productIds:@"" noNetWork:^{}];
        }
        break;
    }
    
}

//UITextField协议
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.searchTf resignFirstResponder];
    [SearchSqlite addDataWith:self.classBtn.titleLabel.text content:self.searchTf.text];
    
    [self searchWithApiAndstartIndex:0];
    
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
    if (self.history)
    {
        return 44.0f;
    }
    else 
    {
        NSUInteger index = [self.classArray indexOfObject:self.classBtn.titleLabel.text];
        
        switch (index)
        {
            case 0:  //用户
            {
              return  self.height = [MainContactCell carculateHeightWithModel:nil];
            }
                break;
                
            case 1:  //企业
            {
               return self.height = 110;
            }
                break;
                
            case 2:  //项目
            {
               return self.height = [ProjectTableViewCell carculateCellHeightWithModel:self.array[index]];;
            }
                break;
                
            default:
            {
                return [MainProductCell carculateHeightWithModel:nil];
            }
                break;
        }

    }
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.history)
    {
        UIButton *clearBtn = [[UIButton alloc]init];
        clearBtn.backgroundColor = [UIColor redColor];
        [clearBtn setTitle:@"清除历史记录" forState:UIControlStateNormal];
        [clearBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        return clearBtn;
    }
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.history)//历史
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Histroy"];
        
        if (!cell)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Histroy"];
        }
        cell.textLabel.text = self.array[self.array.count-1-indexPath.row];
        return cell;
    }
    else
    {
        NSUInteger index = [self.classArray indexOfObject:self.classBtn.titleLabel.text];
        
        switch (index)
        {
            case 0:
            {
                MainContactCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Person"];
                if (!cell)
                {
                    cell = [[MainContactCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Person"];
                }
                cell.model = self.array[indexPath.row];
                return cell;
            }
            break;
            
            case 1:  //企业
            {
                CompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Company"];
                if (!cell)
                {
                    cell = [[CompanyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Company"];
                }
                cell.model = self.array[indexPath.row];
                return cell;
            }
            break;
                
            case 2:  //xiangmu
            {
                ProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Project"];
                if (!cell)
                {
                    cell = [[ProjectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Project"];
                }
                cell.model = self.array[indexPath.row];
                return cell;
            }
                break;
                
            default:
            {
                MainProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Product"];
                if (!cell)
                {
                    cell = [[MainProductCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Product"];
                }
                cell.model = self.array[indexPath.row];
                return cell;
            }
            break;
        }
    }
    
 }

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.history)
    {
        self.searchTf.text = self.array[self.array.count-1-indexPath.row];
        [self.searchTf becomeFirstResponder];
    }
    
}
@end
