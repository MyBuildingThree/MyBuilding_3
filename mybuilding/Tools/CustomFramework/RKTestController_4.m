//
//  RKTestController_4.m
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/30.
//
//

#import "RKTestController_4.h"
#import "ProductApi.h"
#import "ProductModel.h"

@interface RKTestController_4()
@property(nonatomic,strong)NSMutableArray *modelArr;
@end

@implementation RKTestController_4
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
    [ProductApi GetProductListWithBlock:^(NSMutableArray *posts, NSError *error) {
        if(!error){
            
        }
    } startIndex:0 productDesc:@"" userId:@"" productIds:@"" noNetWork:^{
        
    }];
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
    cell.textLabel.text = @"444444444444";

    return cell;
}
@end
