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

@implementation ProjectDetailController

- (void)setUp{
    [super setUp];
    self.tableView.size = CGSizeMake(kScreenWidth, kScreenHeight - 64);
}

- (void)pageControllerFirstLoad{
    [ProjectApi GetProjectInfoWithBlock:^(ProjectModel *proModel, NSMutableArray *contactArr, NSMutableArray *imageArr, NSError *error) {
        NSLog(@"%@",proModel);
    } projectId:self.projectId noNetWork:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor redColor];
    cell.textLabel.text = @"我是详情";
    return cell;
}

- (void)setProjectId:(NSString *)projectId{
    _projectId = [projectId copy];
    [self pageControllerFirstLoad];
}
@end
