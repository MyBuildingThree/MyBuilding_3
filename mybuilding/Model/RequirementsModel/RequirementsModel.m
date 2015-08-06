//
//  RequirementsModel.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RequirementsModel.h"
#import "ImageUrlPath.h"
#import "ManageString.h"

@implementation RequirementsModel
-(void)setDict:(NSDictionary *)dict{
    self.a_reqID = dict[@"reqId"];
    self.a_loginId = dict[@"loginId"];
    self.a_loginName = dict[@"loginName"];
    self.a_avatarUrl = [ImageUrlPath getNetWorkImageUrl:dict[@"loginImagesId"] type:@"login" width:@"" height:@"" cut:@""];
    self.a_createdTime = [ManageString ProjectCardTime:dict[@"createdTime"]];
    self.a_reqTypeCn = dict[@"reqTypeCn"];
    if([dict[@"reqType"] isEqualToString:@"01"]){
        //找项目
        self.a_reqType = 1;
    }else if ([dict[@"reqType"] isEqualToString:@"02"]){
        //找材料
        self.a_reqType = 2;
    }else if ([dict[@"reqType"] isEqualToString:@"03"]){
        //找关系
        self.a_reqType = 3;
    }else if ([dict[@"reqType"] isEqualToString:@"04"]){
        //找合作
        self.a_reqType = 4;
    }else{
        //其他
        self.a_reqType = 5;
    }
    
    if([dict[@"province"] isEqualToString:@""] && [dict[@"city"] isEqualToString:@""]){
        self.a_address = @"";
    }else{
        self.a_address = [NSString stringWithFormat:@"%@ %@",dict[@"province"],dict[@"city"]];
    }
    
    self.a_city = dict[@"city"];
    self.a_reqDesc = dict[@"reqDesc"];
    
    if([dict[@"moneyMin"] isEqualToString:@""] && [dict[@"moneyMax"] isEqualToString:@""]){
        self.a_money = @"不限";
    }else{
        if([dict[@"moneyMin"] isEqualToString:@""]){
            self.a_money = [NSString stringWithFormat:@"不限－%@",dict[@"moneyMax"]];
            
        }else if ([dict[@"moneyMax"] isEqualToString:@""]){
            self.a_money = [NSString stringWithFormat:@"%@－不限",dict[@"moneyMin"]];
        }else{
            self.a_money = [NSString stringWithFormat:@"%@－%@",dict[@"moneyMin"],dict[@"moneyMax"]];
        }
    }
    self.a_bigTypeCn = dict[@"bigTypeCn"];
    self.a_smallTypeCn = dict[@"smallTypeCn"];
    
    if([dict[@"commentsNum"] intValue] >99){
        self.a_commentCount = @"99";
    }else{
        self.a_commentCount = dict[@"commentsNum"];
    }
}
@end
