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
#import "ProjectCreatedUserView.h"
#import "ProjectNameInfoView.h"
#import "ProjectAddressInfoView.h"
#import "ProjectDataInfoView1.h"
#import "ProjectImageInfoView.h"
#import "ProjectDataInfoView2.h"
#import "ProjectContactsInfoView.h"

@interface ProjectDetailController ()

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

@end

@implementation ProjectDetailController

- (void)setUp{
    [super setUp];
    self.tableView.size = CGSizeMake(kScreenWidth, kScreenHeight - 64);
}

- (void)pageControllerFirstLoad{
    [ProjectApi GetProjectInfoWithBlock:^(ProjectModel *proModel, NSMutableArray *contactArr, NSMutableArray *imageArr, NSError *error) {
        NSLog(@"%@",proModel);
        [self.projectNameView setName:proModel.a_projectName describe:@"的实打实大多数顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶" favoriteNum:@"1523" commentNum:@"523" focusNum:@"1523" time:proModel.a_lastUpdatedTime];
        [self.dataInfoView1 setProjectDataInfoViewContents:@[@"123123"]];
        [self.tableView reloadData];
    } projectId:self.projectId noNetWork:nil];
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
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    UIView* sepe = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 1)];
    sepe.backgroundColor = [UIColor redColor];
    [cell addSubview:sepe];
    
    UIView* view = self.viewArr[indexPath.row];
    [cell addSubview:view];
    
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
        ProjectAddressInfoView* view = [[ProjectAddressInfoView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        label.text = @"地址信息";
        [view addSubview:label];
        
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
        ProjectImageInfoView* view = [[ProjectImageInfoView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        label.text = @"图片信息";
        [view addSubview:label];
        
        _imageInfoView = view;
    }
    return _imageInfoView;
}

- (ProjectDataInfoView2 *)dataInfoView2{
    if (!_dataInfoView2) {
        ProjectDataInfoView2* view = [[ProjectDataInfoView2 alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)];
        label.text = @"数据信息2";
        [view addSubview:label];
        
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
