//
//  MainCompanyController.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MainCompanyController.h"
#import "CompanyTableViewCell.h"
#import "CompanyApi.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshBackNormalFooter.h"
#import "CompanyDetailController.h"

@implementation MainCompanyController

- (void)setUp{
    [super setUp];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 30 - 64 - 49);
    [self pageControllerFirstLoad];
    [self setUpHeaderAndFooterRefresh];
}

- (void)setUpHeaderAndFooterRefresh{
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self netWorkWithType:RKControllerRefreshHeader];
    }];
    
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self netWorkWithType:RKControllerRefreshFooter];
    }];
}

/**
 *  接口获取数据
 *
 *  @param refreshType 输入是头刷新还是尾刷新
 */
- (void)netWorkWithType:(RKControllerRefreshType)refreshType{
    BOOL isHeaderRefresh = (refreshType == RKControllerRefreshHeader);
    NSInteger startIndex = isHeaderRefresh ? 0 : (self.startIndex + 1);
    [CompanyApi GetCompanyListWithBlock:^(NSMutableArray *posts, NSError *error) {
        if (!error) {
            if (isHeaderRefresh) [self.models removeAllObjects];
            [self.models addObjectsFromArray:posts];
            [self.tableView reloadData];
            self.startIndex = startIndex;
        }
        isHeaderRefresh ? [self.tableView.header endRefreshing] : [self.tableView.footer endRefreshing];
    } startIndex:startIndex keyWords:@"" noNetWork:nil];
}

- (void)pageControllerFirstLoad{
    [self netWorkWithType:RKControllerRefreshFirstLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [NSString stringWithFormat:@"CompanyTableViewCell"];
    CompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[CompanyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.model = self.models[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CompanyModel *model = self.models[indexPath.row];
    CompanyDetailController *view = [[CompanyDetailController alloc] init];
    view.companyID = model.a_companyID;
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
}
@end
