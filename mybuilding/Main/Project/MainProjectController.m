//
//  MainProjectController.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MainProjectController.h"
#import "ProjectTableViewCell.h"
#import "ProjectApi.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshBackNormalFooter.h"

@implementation MainProjectController

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
    [ProjectApi GetPiProjectSeachWithBlock:^(NSMutableArray *posts, NSError *error) {
        if (!error) {
            if (isHeaderRefresh) [self.models removeAllObjects];
            [self.models addObjectsFromArray:posts];
            [self.tableView reloadData];
            self.startIndex = startIndex;
        }
        isHeaderRefresh ? [self.tableView.header endRefreshing] : [self.tableView.footer endRefreshing];
    } startIndex:startIndex keywords:@"" noNetWork:nil];
}

- (void)pageControllerFirstLoad{
    [self netWorkWithType:RKControllerRefreshFirstLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProjectModel *model = self.models[indexPath.row];
    return [ProjectTableViewCell carculateCellHeightWithModel:model];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [NSString stringWithFormat:@"ProjectTableViewCell"];
    ProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[ProjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ProjectModel *model = self.models[indexPath.row];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProjectModel *model = self.models[indexPath.row];
    [ProjectApi GetProjectInfoWithBlock:^(ProjectModel *proModel, NSMutableArray *contactArr, NSMutableArray *imageArr ,NSError *error) {
        if(!error){
            NSLog(@"====>%@",proModel.a_projectID);
        }
    } projectId:model.a_projectID noNetWork:^{
        
    }];
}
@end
