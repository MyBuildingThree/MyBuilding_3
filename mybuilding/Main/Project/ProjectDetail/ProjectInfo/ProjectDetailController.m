//
//  ProjectDetailController.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectDetailController.h"
#import "UIView+ViewKit.h"
#import "ProjectApi.h"
#import "ProjectImageModel.h"
#import "ProjectContactModel.h"

#import "ProjectCreatedUserView.h"
#import "ProjectNameInfoView.h"
#import "ProjectAddressInfoView.h"
#import "ProjectDataInfoView1.h"
#import "ProjectImageInfoView.h"
#import "ProjectDataInfoView2.h"
#import "ProjectContactsInfoView.h"

@interface ProjectDetailController ()<ProjectImageInfoViewDelegate>

/**
 *  存各cell的view
 */
@property(nonatomic, strong) NSMutableArray* viewArr;

@property(nonatomic, strong) ProjectCreatedUserView* createdUserView;
@property(nonatomic, strong) ProjectNameInfoView* projectNameView;
@property(nonatomic, strong) ProjectAddressInfoView* addressInfoView;
@property(nonatomic, strong) ProjectDataInfoView1* dataInfoView1;
@property(nonatomic, strong) ProjectImageInfoView* imageInfoView;
@property(nonatomic, strong) ProjectDataInfoView2* dataInfoView2;
@property(nonatomic, strong) ProjectContactsInfoView* contactsInfoView;

@property(nonatomic, strong) ProjectModel* projectModel;
@property(nonatomic, strong) NSArray* imageArr;

@end

@implementation ProjectDetailController

- (void)setUp{
    [super setUp];
    self.tableView.size = CGSizeMake(kScreenWidth, kScreenHeight - 64);
    [self setUpFooterView];
}

- (void)setUpFooterView{
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
    [btn setTitle:@"向下滑动查看更多" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.tableView.tableFooterView = btn;
}

- (void)pageControllerFirstLoad{
    [ProjectApi GetProjectInfoWithBlock:^(ProjectModel *proModel, NSMutableArray *contactArr, NSMutableArray *imageArr, NSError *error) {
        if (!error) {
            self.projectModel = proModel;
            self.imageArr = imageArr;
            [self refreshData];
        }

    } projectId:self.projectId noNetWork:nil];
}

- (void)refreshData{
    [self.projectNameView setName:self.projectModel.a_projectName describe:self.projectModel.a_description favoriteNum:@"1523" commentNum:self.projectModel.a_commentsNum focusNum:@"111" time:self.projectModel.a_lastUpdatedTime];
    [self.dataInfoView1 setProjectDataInfoViewContents:@[self.projectModel.a_exceptStartTime,self.projectModel.a_exceptFinishTime,self.projectModel.a_storeyHeight,self.projectModel.a_area,self.projectModel.a_investment,self.projectModel.a_foreignInvestment,self.projectModel.a_plotRatio,self.projectModel.a_storeyArea,self.projectModel.a_ownerType,self.projectModel.a_usage]];
    [self.dataInfoView2 setProjectDataInfoViewContents:@[self.projectModel.a_exceptStartTime,self.projectModel.a_exceptFinishTime,self.projectModel.a_elevator,self.projectModel.a_mainDesignStage,self.projectModel.a_stealStructure,self.projectModel.a_airCondition,self.projectModel.a_heating,self.projectModel.a_externalWallMeterial,self.projectModel.a_actureStartTime,self.projectModel.a_fireControl,self.projectModel.a_green,self.projectModel.a_electorWeakInstallation,self.projectModel.a_decorationSituation,self.projectModel.a_decorationProcess]];
    [self.addressInfoView setContent:@"我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址我是一个地址"];
    
    ProjectImageModel* imageModel = self.imageArr.firstObject;
    [self.imageInfoView setImageUrl:imageModel.a_imageCompressLocation imageNum:[NSString stringWithFormat:@"%d张图片",(int)self.imageArr.count]];
    
    [self.tableView reloadData];

}

- (void)imageInfoViewClicked:(ProjectImageInfoView *)imageInfoView{
    NSLog(@"imageInfoViewClicked");
}

- (void)addressViewClicked{
    NSLog(@"addressViewClicked");
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UIView* view = self.viewArr[indexPath.row];
    return view.height;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView* sepe = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    sepe.backgroundColor = [UIColor redColor];
    [cell addSubview:sepe];
    
    UIView* view = self.viewArr[indexPath.row];
    [cell.contentView addSubview:view];
    
    return cell;
}

- (ProjectCreatedUserView *)createdUserView{
    if (!_createdUserView) {
        ProjectCreatedUserView* view = [[ProjectCreatedUserView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        label.text = @"我是创建者";
        [view addSubview:label];
        
        _createdUserView = view;
    }
    return _createdUserView;
}

- (ProjectNameInfoView *)projectNameView{
    if (!_projectNameView) {
        ProjectNameInfoView* view = [[ProjectNameInfoView alloc] init];
        
        _projectNameView = view;
    }
    return _projectNameView;
}

- (ProjectAddressInfoView *)addressInfoView{
    if (!_addressInfoView) {
        ProjectAddressInfoView* view = [[ProjectAddressInfoView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 125)];
        [view addTarget:self action:@selector(addressViewClicked) forControlEvents:UIControlEventTouchUpInside];
        
        _addressInfoView = view;
    }
    return _addressInfoView;
}

- (ProjectDataInfoView1 *)dataInfoView1{
    if (!_dataInfoView1) {
        ProjectDataInfoView1* view = [[ProjectDataInfoView1 alloc] init];
        
        _dataInfoView1 = view;
    }
    return _dataInfoView1;
}

- (ProjectImageInfoView *)imageInfoView{
    if (!_imageInfoView) {
        ProjectImageInfoView* view = [[ProjectImageInfoView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 125)];
        view.delegate = self;
        
        _imageInfoView = view;
    }
    return _imageInfoView;
}

- (ProjectDataInfoView2 *)dataInfoView2{
    if (!_dataInfoView2) {
        ProjectDataInfoView2* view = [[ProjectDataInfoView2 alloc] init];
        
        _dataInfoView2 = view;
    }
    return _dataInfoView2;
}

- (ProjectContactsInfoView *)contactsInfoView{
    if (!_contactsInfoView) {
        ProjectContactsInfoView* view = [[ProjectContactsInfoView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        label.text = @"联系人信息";
        [view addSubview:label];
        
        _contactsInfoView = view;
    }
    return _contactsInfoView;
}

- (NSMutableArray *)viewArr{
    if (!_viewArr) {
        NSMutableArray* viewArr = [NSMutableArray array];
        [viewArr addObject:self.createdUserView];
        [viewArr addObject:self.projectNameView];
        [viewArr addObject:self.addressInfoView];
        [viewArr addObject:self.dataInfoView1];
        [viewArr addObject:self.imageInfoView];
        [viewArr addObject:self.dataInfoView2];
        [viewArr addObject:self.contactsInfoView];
        
        _viewArr = viewArr;
    }
    return _viewArr;
}

- (void)setProjectId:(NSString *)projectId{
    _projectId = [projectId copy];
    [self pageControllerFirstLoad];
}
@end
