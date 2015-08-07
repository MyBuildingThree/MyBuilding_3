//
//  CompanyDetailController.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CompanyDetailController.h"
#import "CompanyHeadCell.h"
#import "CompanyApi.h"
#import "CompanyModel.h"
#import "CompanyContentCell.h"
#import "CompanyOtherCell.h"
#import "CompanyProductCell.h"
#import "UIView+ViewKit.h"
#import "RKShadowView.h"

@interface CompanyDetailController()
@property(nonatomic,strong)CompanyModel *companyModel;
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSMutableArray *countArr;
@property(nonatomic,strong)NSMutableArray *productArr;
@end

@implementation CompanyDetailController
- (void)viewDidLoad{
    [super viewDidLoad];
    [self initNav];
    [self loadCompanyInfo];
    [self initTableView];
    self.tableView.backgroundColor = RGBCOLOR(248, 248, 248);
}

-(NSArray *)titleArr{
    if(!_titleArr){
        _titleArr = [[NSArray alloc] initWithObjects:@"所有产品",@"所有项目" ,nil];
    }
    return _titleArr;
}

-(void)initNav{
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:19], NSFontAttributeName,nil]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *focusBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [focusBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [focusBtn setTitle:@"关注" forState:UIControlStateNormal];
    UIBarButtonItem *focusItem = [[UIBarButtonItem alloc]initWithCustomView:focusBtn];
    
    UIButton *requirementBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    [requirementBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [requirementBtn setTitle:@"发需求" forState:UIControlStateNormal];
    UIBarButtonItem *requirementItem = [[UIBarButtonItem alloc]initWithCustomView:requirementBtn];
    
    self.navigationItem.rightBarButtonItems = @[requirementItem,focusItem];
}

-(void)loadCompanyInfo{
    [CompanyApi GetCompanyDetailWithBlock:^(CompanyModel *companyModel, NSError *error) {
        if(!error){
            self.companyModel = companyModel;
            self.countArr = [[NSMutableArray alloc] init];
            [self.countArr addObject:self.companyModel.a_productNum];
            [self.countArr addObject:self.companyModel.a_projectNum];
            self.productArr = [[NSMutableArray alloc] init];
            [self.tableView reloadData];
        }
    } companyId:self.companyID noNetWork:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }else if(section == 1){
        return 1;
    }else if (section == 2){
        if(self.productArr.count == 0){
            return 1;
        }else{
            return self.productArr.count;
        }
    }else{
        return self.titleArr.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;{
    if(section == 0){
        return 0;
    }else if (section == 3){
        return 10;
    }
    return 35;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 176;
    }else if (indexPath.section == 1){
        return [CompanyContentCell carculateCellHeightWithString:self.companyModel.a_companyDescription];
    }else if(indexPath.section == 2){
        if(self.productArr.count == 0){
            return 45;
        }else{
            return 66;
        }
    }
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return nil;
    }else if(section == 1){
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        bgView.backgroundColor = RGBCOLOR(248, 248, 248);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth-20, 15)];
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = RGBCOLOR(155, 155, 155);
        label.text = @"公司简介";
        [bgView addSubview:label];
        return bgView;
    }else if (section == 2){
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
        bgView.backgroundColor = RGBCOLOR(248, 248, 248);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth-20, 15)];
        label.textAlignment = NSTextAlignmentLeft;
        label.textColor = RGBCOLOR(155, 155, 155);
        label.text = @"产品列表";
        [bgView addSubview:label];
        return bgView;
    }else{
        return nil;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        NSString *CellIdentifier = [NSString stringWithFormat:@"CompanyHeadCell"];
        CompanyHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell=[[CompanyHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.model = self.companyModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        NSString *CellIdentifier = [NSString stringWithFormat:@"CompanyContentCell"];
        CompanyContentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell=[[CompanyContentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.content = self.companyModel.a_companyDescription;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 2){
        if(self.productArr.count == 0){
            NSString *CellIdentifier = [NSString stringWithFormat:@"CompanyOtherCell"];
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 20)];
            label.textColor = RGBCOLOR(68, 74, 89);
            label.textAlignment = NSTextAlignmentLeft;
            label.font = [UIFont systemFontOfSize:16];
            label.text = @"暂无数据";
            [cell.contentView addSubview:label];
            
            UIView *cutLine = [RKShadowView seperatorLine];
            [cutLine setMinY:44];
            [cell.contentView addSubview:cutLine];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            NSString *CellIdentifier = [NSString stringWithFormat:@"CompanyOtherCell"];
            CompanyProductCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell=[[CompanyProductCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else if (indexPath.section == 3){
        NSString *CellIdentifier = [NSString stringWithFormat:@"CompanyOtherCell"];
        CompanyOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell=[[CompanyOtherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.titleLabel.text = self.titleArr[indexPath.row];
        cell.countLabel.text = self.countArr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        NSString *CellIdentifier = [NSString stringWithFormat:@"CompanyTableViewCell"];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        //cell.model = self.models[indexPath.row];
        cell.textLabel.text = @"adsfasd";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat sectionHeaderHeight = 35;
    //固定section 随着cell滚动而滚动
    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
        
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        
    } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
        
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        
    }
    
}
@end
