//
//  ProjectDetailViewController.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectDetailViewController.h"
#import "UIView+ViewKit.h"
#import "RKPageController.h"

@interface ProjectDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
/**
 *  项目详情的控制器
 */
@property(nonatomic, strong) RKPageController* detailController;

/**
 *  评论详情的控制器
 */
@property(nonatomic, strong) RKPageController* commentController;

@end


@implementation ProjectDetailViewController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.detailController.tableView setMinY:0];
    [self.commentController.tableView setMinY:self.detailController.tableView.maxY];
}

//- (UITableView *)tableView1{
//    if (!_tableView1) {
//        UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        tableView.delegate = self;
//        tableView.dataSource = self;
//        [self.view addSubview:tableView];
//        
//        _tableView1 = tableView;
//    }
//    return _tableView1;
//}
//
//- (UITableView *)tableView2{
//    if (!_tableView2) {
//        UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        tableView.delegate = self;
//        tableView.dataSource = self;
//        [self.view addSubview:tableView];
//        
//        _tableView2 = tableView;
//    }
//    return _tableView2;
//}

//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    NSLog(@"22");
//    [UIView animateWithDuration:.5 animations:^{
//        [self.tableView1 setMinY:-self.tableView1.height];
//        [self.tableView2 setMinY:0];
//    }];
//}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 5;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 100;
//}
//
//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (!cell) {
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//
//    cell.textLabel.text = (tableView == self.tableView1) ? @"111" : @"222";
//    cell.backgroundColor = (tableView == self.tableView1) ? [UIColor redColor] : [UIColor blueColor];
//    
//    return cell;
//}

- (RKPageController *)detailController{
    if (!_detailController) {
        RKPageController* pageController = [[RKPageController alloc] initWithNavi:self.navigationController];
        
        _detailController = pageController;
    }
    return _detailController;
}

- (RKPageController *)commentController{
    if (!_commentController) {
        RKPageController* pageController = [[RKPageController alloc] initWithNavi:self.navigationController];
        
        _commentController = pageController;
    }
    return _commentController;
}
@end
