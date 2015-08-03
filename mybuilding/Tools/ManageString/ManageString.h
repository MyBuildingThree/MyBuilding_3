//
//  ManageString.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  处理各种字符串
 */
@interface ManageString : NSObject

/**
 *  处理项目卡片上的时间
 *
 *  @param str 时间的字符串 （2015-07-30 15:09:54）
 *
 *  @return 新的时间字符串 (2015-07-30 15:09)
 */
+(NSString *)ProjectCardTime:(NSString *)str;

/**
 *   处理项目卡片上的阶段
 *
 *  @param str 项目阶段的字符串 
 *             1 土地信息阶段，
 *             2 主体设计阶段，
 *             3 主体施工阶段，
 *             4 装修阶段
 *
 *  @return 新的阶段字符串
 */
+(NSString *)ProjectCardStage:(NSString *)str;
@end
