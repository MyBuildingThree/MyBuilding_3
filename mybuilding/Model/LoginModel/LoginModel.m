//
//  LoginModel.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
-(void)setDict:(NSDictionary *)dict{
    [LoginSqlite insertData:dict[@"loginId"] datakey:@"userId"];
    [LoginSqlite insertData:dict[@"loginName"] datakey:@"userName"];
    [LoginSqlite insertData:dict[@"token"] datakey:@"token"];
    [LoginSqlite insertData:dict[@"headImageId"] datakey:@"userImage"];
    [LoginSqlite insertData:dict[@"userType"] datakey:@"userType"];
    [LoginSqlite insertData:dict[@"loginTel"] datakey:@"userPhone"];
    [LoginSqlite insertData:dict[@"contactName"] datakey:@"contactName"];
    [LoginSqlite insertData:dict[@"contactTel"] datakey:@"contactTel"];
}
@end
