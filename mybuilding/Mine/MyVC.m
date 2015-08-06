//
//  MyVC.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MyVC.h"

@interface MyVC ()

@end

@implementation MyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addRightBarButtonItems];
}

//导航栏的items
-(void)addRightBarButtonItems
{
    UIButton *infBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 78, 44)];
    infBtn.titleEdgeInsets = UIEdgeInsetsMake(11.5, 0, 11.5, 0);
    [infBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [infBtn setTitle:@"消息中心" forState:UIControlStateNormal];
    UIBarButtonItem *infItem = [[UIBarButtonItem alloc]initWithCustomView:infBtn];
    
    UIButton *setBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 78, 44)];
    setBtn.titleEdgeInsets = UIEdgeInsetsMake(11.5, 0, 11.5, 0);
    [setBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [setBtn setTitle:@"帐号设置" forState:UIControlStateNormal];
    UIBarButtonItem *setItem = [[UIBarButtonItem alloc]initWithCustomView:setBtn];
    
    self.navigationItem.rightBarButtonItems = @[infItem,setItem];
}



@end
