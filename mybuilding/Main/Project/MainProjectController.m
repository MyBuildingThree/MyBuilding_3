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
#import "RKImageLabel.h"
#import "UIView+ViewKit.h"
#import "RKShadowView.h"
#import "ProjectDetailViewController.h"

@interface MainProjectController()<RKImageLabelDelegate>

@end

@implementation MainProjectController

- (void)setUp{
    [super setUp];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 30 - 64 - 49);
    [self setUpHeaderView];
    [self pageControllerFirstLoad];
    [self setUpHeaderAndFooterRefresh];
}

- (void)setUpHeaderView{
    UIView* bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    bgView.backgroundColor = RGBCOLOR(243, 243, 243);
    
    NSArray* titles = @[@"专题",@"语音搜索",@"地图搜索",@"高级搜索"];
    for (int i = 0; i < 4; i++ ) {
        RKImageLabel* imageLabel = [RKImageLabel imageLabelWithHeight:50 direction:RKImageLabelDirectionBottom];
        imageLabel.backgroundColor = RGBCOLOR(243, 243, 243);
        imageLabel.imageView.frame = CGRectMake(0, 0, 25, 25);
        imageLabel.mainLabel.text = titles[i];
        imageLabel.mainLabel.font = [UIFont systemFontOfSize:12];
        imageLabel.mainLabel.textColor = RGBCOLOR(127, 127, 127);
        imageLabel.firstMargin = 4.0;
        imageLabel.thirdMargin = 3.0;
        imageLabel.canClickedSize = CGSizeMake(kScreenWidth / 4, 50);
        imageLabel.delegate = self;
        imageLabel.tag = i;
        imageLabel.center = CGPointMake(bgView.width / 4 * (i + 0.5), bgView.halfHeight);
        
        [bgView addSubview:imageLabel];
        
//        imageLabel.backgroundColor = [[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:.5];
        imageLabel.imageView.backgroundColor = [UIColor redColor];
    }
    
    UIView* sepe = [RKShadowView seperatorLine];
    [sepe setMaxY:bgView.maxY];
    [bgView addSubview:sepe];
    
    self.tableView.tableHeaderView = bgView;
}

- (void)imageLabelClicked:(RKImageLabel *)imageLabel{
    NSLog(@"tag = %d",(int)imageLabel.tag);
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ProjectDetailViewController* vc = [[ProjectDetailViewController alloc] init];
    [vc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
