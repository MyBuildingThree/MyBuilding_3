//
//  CommentModel.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/10.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CommentModel.h"
#import "ManageString.h"

@implementation CommentModel
-(void)setDict:(NSDictionary *)dict{
    self.a_id = dict[@"commentId"];
    self.a_entityId = dict[@"paramId"];
    self.a_userName = dict[@"loginName"];
    self.a_commentContents = dict[@"content"];
    self.a_avatarUrl = [ImageUrlPath getNetWorkImageUrl:dict[@"loginImagesId"] type:@"login" width:@"" height:@"" cut:@""];
    self.a_userType = dict[@"userType"];
    self.a_createdTime = [ManageString ProjectCardTime:dict[@"createdTime"]];
    self.a_loginId = dict[@"loginId"];
}
@end
