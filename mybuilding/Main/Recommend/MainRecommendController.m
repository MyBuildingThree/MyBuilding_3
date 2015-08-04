//
//  MainRecommendController.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MainRecommendController.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefreshNormalHeader.h"
#import "MJRefreshBackNormalFooter.h"
#import "RecommendApi.h"
#import "RecommendModel.h"
#import "ProjectTableViewCell.h"
#import "MainContactCell.h"
#import "CompanyTableViewCell.h"
#import "MainProductCell.h"

@implementation MainRecommendController

-(void)setUp{
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
    [RecommendApi getAllRecommendInfo:^(NSMutableArray *posts, NSError *error) {
        if(!error){
            if (isHeaderRefresh) [self.models removeAllObjects];
            [self.models addObjectsFromArray:posts];
            [self.tableView reloadData];
            self.startIndex = startIndex;
        }
        isHeaderRefresh ? [self.tableView.header endRefreshing] : [self.tableView.footer endRefreshing];
    } startIndex:self.startIndex noNetWork:nil];
}

- (void)pageControllerFirstLoad{
    [self netWorkWithType:RKControllerRefreshFirstLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.models.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendModel *model = self.models[indexPath.row];
    if(model.a_sourceType == 1){
        return [MainContactCell carculateHeightWithModel:nil];
    }else if (model.a_sourceType == 2){
        return 110;
    }else if (model.a_sourceType == 3){
        NSLog(@"%f",[ProjectTableViewCell carculateCellHeightWithModel:model.a_projectModel]);
        return [ProjectTableViewCell carculateCellHeightWithModel:model.a_projectModel];
    }else if (model.a_sourceType == 4){
        return [MainProductCell carculateHeightWithModel:nil];
    }else{
        return 0;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendModel *model = self.models[indexPath.row];
    if(model.a_sourceType == 1){
        MainContactCell* cell=[tableView dequeueReusableCellWithIdentifier:@"MainContactCell"];
        if (!cell) {
            cell=[[MainContactCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainContactCell"];
        }
        cell.model = model.a_personModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (model.a_sourceType == 2){
        NSString *CellIdentifier = [NSString stringWithFormat:@"CompanyTableViewCell"];
        CompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell=[[CompanyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.model = model.a_companyModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (model.a_sourceType == 3){
        NSString *CellIdentifier = [NSString stringWithFormat:@"ProjectTableViewCell"];
        ProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell=[[ProjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.model = model.a_projectModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }else if (model.a_sourceType == 4){
        MainProductCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell=[[MainProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        cell.model = model.a_productModel;
        return cell;
    }else{
        NSString *CellIdentifier = [NSString stringWithFormat:@"cell"];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        return cell;
    }
}
@end
