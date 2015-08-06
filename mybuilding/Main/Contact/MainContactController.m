//
//  MainContactController.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MainContactController.h"
#import "MainContactCell.h"
#import "PersonApi.h"
#import "PersonModel.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshBackNormalFooter.h"
#import "RKImageLabel.h"
#import "UIView+ViewKit.h"

@implementation MainContactController
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
    [PersonApi SearchUserWithBlock:^(NSMutableArray *posts, NSError *error) {
        if (!error) {
            if (isHeaderRefresh) [self.models removeAllObjects];
            [self.models addObjectsFromArray:posts];
            [self.tableView reloadData];
            self.startIndex = startIndex;
        }
        isHeaderRefresh ? [self.tableView.header endRefreshing] : [self.tableView.footer endRefreshing];
    } keywords:@"" startIndex:startIndex noNetWork:nil];
}

- (void)pageControllerFirstLoad{
    [self netWorkWithType:RKControllerRefreshFirstLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [MainContactCell carculateHeightWithModel:nil];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainContactCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[MainContactCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.model = self.models[indexPath.row];
    return cell;
}
@end
