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
    self.a_companyName = dict[@"companyName"];
    self.a_companyLogo = [ImageUrlPath getNetWorkImageUrl:dict[@"headImageId"] type:@"login" width:@"" height:@"" cut:@""];
    self.a_companyIndustry = dict[@"companyIndustry"];
    self.a_companyFocusNumber = dict[@"focusNum"];
    self.a_companyEmployeeNumber = dict[@"employeesNum"];
    self.a_companyDescription = dict[@"companyDesc"];
    if([dict[@"isFocus"] isEqualToString:@"0"]){
        self.a_focused = NO;
    }else{
        self.a_focused = YES;
    }
    self.a_companyContactName = dict[@"contactName"];
    self.a_companyContactCellphone = dict[@"contactTel"];
    self.a_companyContactEmail = dict[@"companyEmail"];
    self.a_companyLocation = dict[@"address"];
    self.a_companyProvince = dict[@"landProvince"];
    self.a_companyCity = dict[@"landCity"];
    self.a_companyDistrict = dict[@"landDistrict"];
    self.a_reviewStatus = dict[@"reviewStatus"];
}
@end
