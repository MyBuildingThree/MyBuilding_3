//
//  CompanyApi.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompanyModel.h"

/**
 *  关于公司的接口
 */
@interface CompanyApi : NSObject
/**
 *  获取公司列表
 *
 *  @param block      回调给页面的数据 CompanyModel
 *  @param startIndex 分页 从0开始
 *  @param keyWords   搜索的关键字
 *  @param noNetWork  没有网络的情况处理
 */
+(void)GetCompanyListWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block startIndex:(NSInteger)startIndex keyWords:(NSString *)keyWords noNetWork:(void(^)())noNetWork;

/**
 *  获取公司详情
 *
 *  @param block     回调给页面的数据 CompanyModel
 *  @param companyId 公司的ID
 *  @param noNetWork 没有网络的情况处理
 */
+ (void)GetCompanyDetailWithBlock:(void (^)(CompanyModel *companyModel, NSError *error))block companyId:(NSString *)companyId noNetWork:(void(^)())noNetWork;
@end
