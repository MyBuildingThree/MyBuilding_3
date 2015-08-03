//
//  ManageString.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ManageString.h"

@implementation ManageString
+(NSString *)ProjectCardTime:(NSString *)str{
    NSString *string = nil;
    if([[NSString stringWithFormat:@"%@",str] isEqualToString:@"(null)"]||[[NSString stringWithFormat:@"%@",str] isEqualToString:@"<null>"]||[[NSString stringWithFormat:@"%@",str] isEqualToString:@""]){
        string = @"";
    }else{
        NSArray *arr = [str componentsSeparatedByString:@" "];
        NSArray *dateArr = [arr[0] componentsSeparatedByString:@"-"];
        NSArray *timeArr = [arr[1] componentsSeparatedByString:@":"];
        string = [NSString stringWithFormat:@"%@-%@-%@ %@:%@",dateArr[0],dateArr[1],dateArr[2],timeArr[0],timeArr[1]];
    }
    return string;
}

+(NSString *)ProjectCardStage:(NSString *)str{
    NSString *string = nil;
    if([[NSString stringWithFormat:@"%@",str] isEqualToString:@"(null)"]||[[NSString stringWithFormat:@"%@",str] isEqualToString:@"<null>"]||[[NSString stringWithFormat:@"%@",str] isEqualToString:@""]){
        string = @"";
    }else{
        if([str isEqualToString:@"1"]){
            string = @"土地信息阶段";
        }else if ([str isEqualToString:@"2"]){
            string = @"主体设计阶段";
        }else if ([str isEqualToString:@"3"]){
            string = @"主体施工阶段";
        }else if([str isEqualToString:@"4"]){
            string = @"装修阶段";
        }else{
            string = @"暂无数据";
        }
    }
    return string;
}
@end
