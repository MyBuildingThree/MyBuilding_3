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
    
    self.a_companyName = dict[@"companyName"];
    
    self.a_duties = dict[@"duties"];
    
    self.a_isFriend = ![dict[@"isFriend"] isEqualToString:@"0"];
    
    self.a_isWaiting = ![dict[@"waiting"] isEqualToString:@"0"];
}
@end
