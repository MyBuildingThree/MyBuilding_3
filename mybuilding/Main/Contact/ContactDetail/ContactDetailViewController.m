//
//  ContactDetailViewController.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ContactDetailViewController.h"
#import "PersonApi.h"
#import "PersonModel.h"
#import "ContactHeadCell.h"
#import "ContactFriendsCell.h"
#import "ContactCompanyCell.h"
#import "ContactWorkHistoryCell.h"
#import "ContactOtherCell.h"
#import "UIView+ViewKit.h"
#import "RKShadowView.h"

@interface ContactDetailViewController ()
@property(nonatomic,strong)PersonModel *personModel;
@property(nonatomic,strong)NSArray *titleArr;
@property(nonatomic,strong)NSMutableArray *countArr;
@property(nonatomic,strong)NSMutableArray *personlArr;
@end

@implementation ContactDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNav];
    [self loadContactInfo];
    [self initTableView];
    self.tableView.backgroundColor = RGBCOLOR(248, 248, 248);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    UIButton *addFriendBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    [addFriendBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addFriendBtn setTitle:@"加好友" forState:UIControlStateNormal];
    UIBarButtonItem *addFriendItem = [[UIBarButtonItem alloc]initWithCustomView:addFriendBtn];
    
    UIButton *requirementBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 44)];
    [requirementBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [requirementBtn setTitle:@"发需求" forState:UIControlStateNormal];
    UIBarButtonItem *requirementItem = [[UIBarButtonItem alloc]initWithCustomView:requirementBtn];
    
    self.navigationItem.rightBarButtonItems = @[requirementItem,addFriendItem,focusItem];
}

-(void)loadContactInfo{
    [PersonApi GetUserInformationWithBlock:^(PersonModel *model, NSError *error) {
        if(!error){
            self.personModel = model;
            self.countArr = [[NSMutableArray alloc] init];
            [self.countArr addObject:self.personModel.a_productNum];
            [self.countArr addObject:self.personModel.a_projectNum];
            [self.tableView reloadData];
        }
    } userId:self.contactID noNetWork:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 1;
    }else if(section == 1){
        return 1;
    }else if (section == 2){
        return 1;
    }else if (section == 3){
        return 1;
    }else{
        return self.titleArr.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;{
    if(section == 0){
        return 0;
    }else if (section == 4){
        return 10;
    }
    return 35;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 96;
    }else if (indexPath.section == 1){
        if(self.personlArr.count == 0){
            return 45;
        }else{
            return 90;
        }
    }else if (indexPath.section == 2){
        if(!self.personModel.a_isCompany){
            return 45;
        }else{
            return 70;
        }
    }else if(indexPath.section == 3){
        if(self.personModel.a_isWorkHistory){
            return 66;
        }else{
            return 45;
        }
    }
    return 45;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return nil;
    }else if(section == 1){
        UIView *bgView = [self addSectionView:@"共同好友"];
        return bgView;
    }else if (section == 2){
        UIView *bgView = [self addSectionView:@"认证公司"];
        return bgView;
    }else if (section == 3){
        UIView *bgView = [self addSectionView:@"个人背景"];
        return bgView;
    }else{
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
        bgView.backgroundColor = RGBCOLOR(248, 248, 248);
        return bgView;
    }
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        NSString *CellIdentifier = [NSString stringWithFormat:@"ContactHeadCell"];
        ContactHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell=[[ContactHeadCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.model = self.personModel;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        if(self.personlArr.count == 0){
            NSString *CellIdentifier = [NSString stringWithFormat:@"ContactFriendsCell"];
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
            NSString *CellIdentifier = [NSString stringWithFormat:@"ContactFriendsCell"];
            ContactFriendsCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell=[[ContactFriendsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else if (indexPath.section == 2){
        if(!self.personModel.a_isCompany){
            NSString *CellIdentifier = [NSString stringWithFormat:@"ContactCompanyCell"];
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
            NSString *CellIdentifier = [NSString stringWithFormat:@"ContactCompanyCell"];
            ContactCompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell=[[ContactCompanyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cell.model = self.personModel;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else if (indexPath.section == 3){
        NSLog(@"===>%d",self.personModel.a_isWorkHistory);
        if(self.personModel.a_isWorkHistory){
            NSString *CellIdentifier = [NSString stringWithFormat:@"ContactWorkHistoryCell"];
            ContactWorkHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            if (!cell) {
                cell=[[ContactWorkHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else{
            NSString *CellIdentifier = [NSString stringWithFormat:@"ContactWorkHistoryCell"];
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
        }
    }else if (indexPath.section == 4){
        NSString *CellIdentifier = [NSString stringWithFormat:@"ContactOtherCell"];
        ContactOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell) {
            cell=[[ContactOtherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.titleLabel.text = self.titleArr[indexPath.row];
        cell.countLabel.text = self.countArr[indexPath.row];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        NSString *CellIdentifier = [NSString stringWithFormat:@"cell"];
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

-(UIView *)addSectionView:(NSString *)str{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    bgView.backgroundColor = RGBCOLOR(248, 248, 248);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth-20, 15)];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = RGBCOLOR(155, 155, 155);
    label.text = str;
    label.font = [UIFont systemFontOfSize:14];
    [bgView addSubview:label];
    return bgView;
}

@end
