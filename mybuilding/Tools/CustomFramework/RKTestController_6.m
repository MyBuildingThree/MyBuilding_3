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
            
        }
    } startIndex:0 keywords:@"" noNetWork:nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"666666666666";
    
    return cell;
}
@end
