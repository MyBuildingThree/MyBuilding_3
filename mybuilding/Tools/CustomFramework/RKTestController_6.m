//
//  RKTestController_6.m
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/31.
//
//

#import "RKTestController_6.h"
#import "ProjectApi.h"
#import "ProjectModel.h"
#import "ProjectTableViewCell.h"

@interface RKTestController_6()
@property(nonatomic,strong)NSMutableArray *modelArr;
@end

@implementation RKTestController_6
-(void)setUp{
    [super setUp];
    [self loadList];
}

-(NSMutableArray *)modelArr{
    if(!_modelArr){
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}

-(void)loadList{
    [ProjectApi GetPiProjectSeachWithBlock:^(NSMutableArray *posts, NSError *error) {
        if(!error){
            self.modelArr = posts;
            [self.tableView reloadData];
        }
    } startIndex:0 keywords:@"" noNetWork:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ProjectModel *model = self.modelArr[indexPath.row];
    return [ProjectTableViewCell carculateCellHeightWithModel:model];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [NSString stringWithFormat:@"ProjectTableViewCell"];
    ProjectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[ProjectTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    ProjectModel *model = self.modelArr[indexPath.row];
    cell.model = model;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
@end
