//
//  CompanyModel.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CompanyModel.h"
#import "ImageUrlPath.h"

@implementation CompanyModel
-(void)setDict:(NSDictionary *)dict{
    self.a_companyID = dict[@"companyId"];
    if(![dict[@"companyName"] isEqualToString:@""]){
        self.a_companyName = dict[@"companyName"];
    }else{
        self.a_companyName = @"公司名";
    }
    self.a_companyLogo = [ImageUrlPath getNetWorkImageUrl:dict[@"headImageId"] type:@"login" width:@"" height:@"" cut:@""];
    self.a_companyIndustry = dict[@"companyIndustry"];
    self.a_companyFocusNumber = dict[@"focusNum"];
    self.a_companyEmployeeNumber = dict[@"employeesNum"];
    if(![dict[@"companyDesc"] isEqualToString:@""]){
        self.a_companyDescription = dict[@"companyDesc"];
    }else{
        self.a_companyDescription = @"暂无数据";
    }
    if([dict[@"isFocus"] isEqualToString:@"0"]){
        self.a_focused = NO;
    }else{
        self.a_focused = YES;
    }
    if(![dict[@"contactName"] isEqualToString:@""]){
        self.a_companyContactName = dict[@"contactName"];
    }else{
        self.a_companyContactName = @"无";
    }
    if(![dict[@"contactTel"] isEqualToString:@""]){
        self.a_companyContactCellphone = dict[@"contactTel"];
    }else{
        self.a_companyContactCellphone = @"无";
    }
    if(![dict[@"companyEmail"] isEqualToString:@""]){
        self.a_companyContactEmail = dict[@"companyEmail"];
    }else{
        self.a_companyContactEmail = @"无";
    }
    self.a_companyLocation = dict[@"address"];
    self.a_companyProvince = dict[@"landProvince"];
    self.a_companyCity = dict[@"landCity"];
    self.a_companyDistrict = dict[@"landDistrict"];
    self.a_reviewStatus = dict[@"reviewStatus"];
    self.a_productNum = @"11";
    self.a_projectNum = @"12";
}
@end
