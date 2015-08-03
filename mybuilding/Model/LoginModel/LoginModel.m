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
    self.a_userID = dict[@"loginId"];
    self.a_userName = dict[@"wy0001"];
    if(![dict[@"headImageId"] isEqualToString:@""]){
        self.a_userAvatarUrl = [ImageUrlPath getNetWorkImageUrl:dict[@"headImageId"] type:@"login" width:@"" height:@"" cut:@""];
    }else{
        self.a_userAvatarUrl = nil;
    }
}
@end
