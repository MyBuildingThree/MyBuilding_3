//
//  RKTestController_1.m
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/30.
//
//

#import "RKTestController_1.h"
#import "UIView+ViewKit.h"
@implementation RKTestController_1
- (void)setUp{
    [super setUp];
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 20, 20)];
    label1.backgroundColor = [UIColor redColor];
    label1.text = @"1";
    

    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    label2.backgroundColor = [UIColor redColor];
    label2.text = @"2";
    
    UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 20)];
    label3.backgroundColor = [UIColor redColor];
    label3.text = @"3";
    
    UILabel* label4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 50)];
    label4.backgroundColor = [UIColor redColor];
    label4.text = @"4";
    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    
    [UIView horizontalArrangeViews:@[label1,label2,label3,label4] distances:@[@"20",@"50",@"70",@"30"] alignmentType:RKViewArrangeAlignmentMid direction:RKViewArrangeDirectionRight];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"11111111111";
    return cell;
}
@end
