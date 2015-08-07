//
//  ProjectModel.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectModel.h"
#import "ManageString.h"

@implementation ProjectModel
-(void)setDict:(NSDictionary *)dict{
    self.a_projectID = dict[@"projectId"];
    self.a_projectName = dict[@"projectName"];
    self.a_lastUpdatedTime = [ManageString ProjectCardTime:dict[@"lastUpdatedTime"]];
    self.a_commentsNum = dict[@"commentsNum"];
    self.a_landName = dict[@"landName"];
    self.a_district = dict[@"landDistrict"];
    self.a_province = dict[@"landProvince"];
    self.a_city = dict[@"landCity"];
    self.a_landAddress = dict[@"landAddress"];
    self.a_projectAddress = [NSString stringWithFormat:@"%@%@",dict[@"landDistrict"],dict[@"projectAddress"]];
    self.a_area = dict[@"landArea"];
 
    self.a_plotRatio = dict[@"landPlotRatio"];
    self.a_usage = dict[@"landUsagesCn"];
    self.a_description = dict[@"projectDesc"];

    self.a_exceptStartTime = dict[@"startTime"];
    self.a_exceptFinishTime = dict[@"endTime"];
    self.a_investment = dict[@"investment"];

    self.a_storeyArea = dict[@"storeyArea"];
    self.a_storeyHeight = dict[@"storeyHeight"];
    self.a_foreignInvestment = dict[@"isForeignIn"];
    self.a_ownerType = dict[@"ownerTypeCn"];
    self.a_longitude = dict[@"longitude"];
    self.a_latitude = dict[@"latitude"];
    self.a_mainDesignStage = dict[@"mainDesignStageCn"];
    self.a_elevator = dict[@"elevator"];
    self.a_airCondition = dict[@"airCondition"];
    self.a_heating = dict[@"heating"];
    self.a_externalWallMeterial = dict[@"externalWallMeterial"];
    self.a_stealStructure = dict[@"stealStructure"];
    self.a_actureStartTime = dict[@"actureStartTime"];
    self.a_fireControl = dict[@"fireControlCn"];
    self.a_green = dict[@"greenCn"];
    self.a_electorWeakInstallation = dict[@"electroWeakInstallationCn"];
    self.a_decorationSituation = dict[@"decorationSituationCn"];
    self.a_decorationProcess = dict[@"decorationProcessCn"];
    self.a_projectstage = [ManageString ProjectCardStage:dict[@"projectStage"]];
    if([dict[@"isFocus"] isEqualToString:@"0"]){
        self.a_isFocused = NO;
    }else{
        self.a_isFocused = YES;
    }
    self.a_loginId = dict[@"loginId"];
    if([dict[@"isVerify"] isEqualToString:@"00"]){
        self.a_isVerify = NO;
    }else{
        self.a_isVerify = YES;
    }
    
    if([dict[@"verifyApply"] intValue] == 0){
        self.a_verifyApply = NO;
    }else{
        self.a_verifyApply = YES;
    }
    
    if(self.a_isVerify){
        self.a_verifyStage = 2;
    }else{
        if(self.a_verifyApply){
            self.a_verifyStage = 1;
        }else{
            self.a_verifyStage = 0;
        }
    }
}
@end
