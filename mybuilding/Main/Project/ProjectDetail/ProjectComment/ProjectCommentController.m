//
//  ProjectCommentController.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectCommentController.h"
#import "UIView+ViewKit.h"
#import "RKLabelLabel.h"
#import "RKShadowView.h"
#import "CommentTabelViewCell.h"
#import "CommentSendFieldView.h"

@interface ProjectCommentController ()

/**
 *  项目名称和发布用户名
 */
@property(nonatomic, strong) RKLabelLabel* projectNameInfoView;

/**
 *  发送评论的view
 */
@property(nonatomic, strong) CommentSendFieldView* commentSendView;

@end

@implementation ProjectCommentController

- (void)setUp{
    [super setUp];
    self.tableView.size = CGSizeMake(kScreenWidth, kScreenHeight - 64 - 49);
    self.tableView.showsVerticalScrollIndicator = NO;
    self.commentSendView.minY = self.tableView.maxY;
    [self.view addSubview:self.commentSendView];
    [self setUpHeaderView];
    [self addKeybordNotification];
}

- (void)setUpHeaderView{
    UIView* bgView = [[UIView alloc] initWithFrame:CGRectZero];
    self.projectNameInfoView.origin = CGPointMake(10, 10);
    self.projectNameInfoView.backgroundColor = [UIColor whiteColor];
    
    UIView* sepe = [RKShadowView seperatorLineWithHeight:10 top:0];
    [sepe setMinY:self.projectNameInfoView.maxY + 10];
    
    [bgView addSubview:self.projectNameInfoView];
    [bgView addSubview:sepe];
    bgView.size = CGSizeMake(kScreenWidth, sepe.maxY);
    
    self.tableView.tableHeaderView = bgView;
}

- (void)pageControllerFirstLoad{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [CommentTabelViewCell carculateHeightWithModel:nil];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentTabelViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[CommentTabelViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell setModel:nil];
    return cell;
}

- (RKLabelLabel *)projectNameInfoView{
    if (!_projectNameInfoView) {
        RKLabelLabel* label = [RKLabelLabel labelLabelWithHeight:0];
        label.maxWidth = kScreenWidth - 2 * 10;
        label.secondMargin = 5;
        label.firstLabel.text = @"我是项目名称我是项目名称我是项目名称我是项目名称我是项目名称我是项目名称我是项目名称我是项目名称我是项目名称我是项目名称我是项目名称";
        label.secondLabel.text = @"我是发布用户我是发布用户我是发布用户我是发布用户我是发布用户我是发布用户我是发布用户我是发布用户我是发布用户";
        label.firstLabel.textColor = RGBCOLOR(51, 51, 51);
        label.secondLabel.textColor = RGBCOLOR(127, 127, 127);
        label.firstLabel.font = [UIFont systemFontOfSize:17];
        label.secondLabel.font = [UIFont systemFontOfSize:15];

        _projectNameInfoView = label;
    }
    return _projectNameInfoView;
}

- (CommentSendFieldView *)commentSendView{
    if (!_commentSendView) {
        _commentSendView = [CommentSendFieldView commentSendFieldView];
    }
    return _commentSendView;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}

- (void)touchesBeganInRKBaseTableView{
    [self.view endEditing:YES];
}
@end
