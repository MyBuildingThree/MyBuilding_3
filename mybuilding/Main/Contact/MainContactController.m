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

@implementation MainContactController
- (void)setUp{
    [super setUp];
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight - 30 - 64 - 49);
    [self pageControllerFirstLoad];
}

- (void)pageControllerFirstLoad{
    [PersonApi SearchUserWithBlock:^(NSMutableArray *posts, NSError *error) {
        NSLog(@"posts = %@",posts);
        self.models = posts;
        [self.tableView reloadData];
    } keywords:@"" startIndex:0 noNetWork:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [MainContactCell carculateHeightWithModel:nil];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainContactCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[MainContactCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.model = self.models[indexPath.row];
    return cell;
}

@end
