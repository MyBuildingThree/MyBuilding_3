//
//  PersonModel.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel
-(void)setDict:(NSDictionary *)dict{
    _dict = dict;
    self.a_id = dict[@"loginId"];
    self.a_name = dict[@"loginName"];
    
    self.a_avatarUrl = [ImageUrlPath getNetWorkImageUrl:dict[@"headImageId"] type:@"login" width:@"180" height:@"180" cut:@""];
    
    self.a_companyName = dict[@"workHistory"][@"companyName"];
    
    self.a_approveCompanyName = dict[@"companyName"];
    
    self.a_duties = dict[@"workHistory"][@"duties"];
    
    self.a_isFriend = ![dict[@"isFriend"] isEqualToString:@"0"];
    
    self.a_isWaiting = ![dict[@"waiting"] isEqualToString:@"0"];
    
    self.a_isSign = NO;
    
    self.a_points = @"123456789";
    
    self.a_exchangeNum = @"19";
    
    self.a_contractNum_begin = @"35";
    
    self.a_contractNum_end = @"18";
    
    self.a_contractNum_close = @"20";
    
    self.a_focusProjectNum = @"10";
    
    self.a_focusPersonNum = @"12";
    
    self.a_focusProductNum = @"13";
    
    self.a_focusCompanyNum = @"34";
    
    self.a_realName = dict[@"realName"];
    
    self.a_sex = dict[@"sex"];
    
    self.a_address = dict[@"address"];
    
    self.a_birthday = dict[@"birthday"];
    
    self.a_constel = dict[@"constel"];
    
    self.a_bloodType = dict[@"bloodTypeCn"];
    
    self.a_email = dict[@"email"];
    
    self.a_loginTel = dict[@"loginTel"];
    
    if([dict[@"workHistory"][@"workHistoryId"] isEqualToString:@""]){
        self.a_isWorkHistory = NO;
    }else{
        self.a_isWorkHistory = YES;
    }
    
    if([dict[@"companyId"] isEqualToString:@""]){
        self.a_isCompany = NO;
    }else{
        self.a_isCompany = YES;
    }
    
    self.a_province = dict[@"landProvince"];
    self.a_city = dict[@"landCity"];
    self.a_district = dict[@"landDistrict"];
    
    self.a_productNum = @"0";
    self.a_projectNum = @"0";
    
    self.a_startTime = dict[@"startTime"];
    self.a_endTime = dict[@"endTime"];
    self.a_workDesc = dict[@"workDesc"];
    if([dict[@"isWorking"] isEqualToString:@"00"]){
        self.a_isWorking = YES;
    }else{
        self.a_isWorking = NO;
    }
}
@end
