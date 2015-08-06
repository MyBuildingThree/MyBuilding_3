//
//  MyModel.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MyModel.h"
#import "LoginSqlite.h"

@implementation MyModel

-(NSMutableDictionary *)personDic
{
    _personDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:[LoginSqlite getdata:@"userImage"],@"userImage",[LoginSqlite getdata:@"userName"],@"userName",@"上海深集科技",@"company",@"飞飞飞",@"manager",nil];
    
    return _personDic;
}

-(NSMutableDictionary *)integralDic
{
    _integralDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1232343234",@"我的积分",@"238",@"兑换记录",nil];
    
    return _integralDic;
}

-(NSMutableDictionary *)contractDic
{
    _contractDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"我的全部合同",@"title",@"35",@"进行中",@"7",@"已完成",@"5",@"已关闭",nil];
    
    return _contractDic;
}

-(NSMutableDictionary *)attentionDic
{
    _attentionDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"我的关注",@"title",@"35",@"关注的项目",@"127",@"关注的人",@"5",@"关注的公司",@"99",@"关注的产品",nil];
    
    return _attentionDic;
}

@end
