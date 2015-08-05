//
//  ProjectContactModel.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectContactModel.h"

@implementation ProjectContactModel
-(void)setDict:(NSDictionary *)dict{
    self.a_contactID = dict[@"contactId"];
    self.a_contactName = dict[@"contactName"];
    self.a_mobilePhone = dict[@"contactTel"];
    self.a_accountName = dict[@"company"];
    self.a_accountAddress = dict[@"companyAddr"];
    self.a_projectId = dict[@"projectId"];
    self.a_projectName = dict[@"contactProjectName"];
    self.a_duties = dict[@"contactDutiesCn"];
    self.a_category = dict[@"contactCategory"];
}
@end
