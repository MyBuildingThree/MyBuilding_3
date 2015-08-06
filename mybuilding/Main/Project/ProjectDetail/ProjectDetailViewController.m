//
//  ProjectDetailViewController.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectDetailViewController.h"
#import "UIView+ViewKit.h"
#import "ProjectDetailController.h"
#import "ProjectCommentController.h"

@interface ProjectDetailViewController ()<RKControllerDelegate>
/**
 *  项目详情的控制器
 */
@property(nonatomic, strong) ProjectDetailController* detailController;

/**
 *  评论详情的控制器
 */
@property(nonatomic, strong) ProjectCommentController* commentController;

@end

typedef enum{
    ShowDetailView,//显示项目详情
    ShowCommentView//显示项目评论
}ShowViewType;

@implementation ProjectDetailViewController

- (instancetype)init{
    if (self = [super init]) {
        [self view];
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self detailController];
    [self commentController];
//    [self showView:ShowDetailView];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (scrollView == self.detailController.tableView) {
        if (scrollView.contentOffset.y + scrollView.height - scrollView.contentSize.height >= 20) {
            [self showView:ShowCommentView];
        }
    }else if (scrollView == self.commentController.tableView) {
        if (scrollView.contentOffset.y <= -20) {
            [self showView:ShowDetailView];
        }
    }
}

/**
 *  显示项目详情或评论详情的界面切换和动画
 *
 *  @param showViewType 显示详情或评论
 */
- (void)showView:(ShowViewType)showViewType{
    BOOL isShowDetail = (showViewType == ShowDetailView);
    
    [UIView animateWithDuration:.5 animations:^{
        isShowDetail ? [self.detailController.view setMinY:64] : [self.detailController.view setMaxY:64];
        isShowDetail ? [self.commentController.view setMinY:kScreenHeight] : [self.commentController.view setMinY:64];
    }];
}

- (ProjectDetailController *)detailController{
    if (!_detailController) {
        ProjectDetailController* pageController = [[ProjectDetailController alloc] initWithNavi:self.navigationController];
        pageController.projectId = self.projectId;
        [pageController.view setMinY:64  height:kScreenHeight - 64];
        pageController.delegate = self;
        [self.view addSubview:pageController.view];
        pageController.tableView.backgroundColor = [UIColor grayColor];
        
        _detailController = pageController;
    }
    return _detailController;
}

- (ProjectCommentController *)commentController{
    if (!_commentController) {
        ProjectCommentController* pageController = [[ProjectCommentController alloc] initWithNavi:self.navigationController];
        [pageController.view setMinY:kScreenHeight  height:kScreenHeight - 64];
        pageController.delegate = self;
        [self.view addSubview:pageController.view];
        
        _commentController = pageController;
    }
    return _commentController;
}

- (void)setProjectId:(NSString *)projectId{
    self.detailController.projectId = projectId;
}
@end
