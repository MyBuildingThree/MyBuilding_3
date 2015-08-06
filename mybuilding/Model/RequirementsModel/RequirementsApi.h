//
//  RequirementsApi.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  需求接口
 */
@interface RequirementsApi : NSObject
/**
 *  获取所有公开的需求列表 get
 *
 *  @param block      接口返回的数据 RequirementsModel
 *  @param startIndex 分页 从0开始
 *  @param keywords   搜索需求的关键字
 *  @param noNetWork  没有网络的情况处理
 */
+ (void)GetAllPublicListWithBlock:(void (^)(NSMutableArray *posts,NSError *error))block startIndex:(NSInteger)startIndex keywords:(NSString *)keywords noNetWork:(void(^)())noNetWork;
@end
