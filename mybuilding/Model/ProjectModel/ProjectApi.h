//
//  ProjectApi.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  和项目有关的接口
 */
@interface ProjectApi : NSObject
/**
 *  项目搜索 get
 *
 *  @param block      接口返回的数据 ProjectModel
 *  @param startIndex 分页 从0开始
 *  @param keywords   搜索的关键字
 *  @param noNetWork  没有网络的情况处理
 */
+ (void)GetPiProjectSeachWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block startIndex:(int)startIndex keywords:(NSString *)keywords noNetWork:(void(^)())noNetWork;
@end
