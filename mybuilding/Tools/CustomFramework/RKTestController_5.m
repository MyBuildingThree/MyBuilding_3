//
//  RKTestController_5.m
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/31.
//
//

#import "RKTestController_5.h"
#import "CompanyTableViewCell.h"
#import "CompanyApi.h"
#import "CompanyModel.h"

@interface RKTestController_5()
@property(nonatomic,strong)NSMutableArray *modelArr;
@end

@implementation RKTestController_5
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
    [CompanyApi GetCompanyListWithBlock:^(NSMutableArray *posts, NSError *error) {
        if(!error){
            self.modelArr = posts;
            [self.tableView reloadData];
        }
    } startIndex:0 keyWords:@"" noNetWork:^{
        
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [NSString stringWithFormat:@"CompanyTableViewCell"];
    CompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell=[[CompanyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.model = self.modelArr[indexPath.row];
    return cell;
}
@end
