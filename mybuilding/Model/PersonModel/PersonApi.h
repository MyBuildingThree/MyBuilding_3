//
//  PersonApi.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  和人有关的接口
 */
@interface PersonApi : NSObject

/**
 *  搜人的接口
 *
 *  @param block      接口返回的数据 PersonModel
 *  @param keywords   搜索的关键字
 *  @param startIndex 分页 从0开始
 *  @param noNetWork  没有网络的情况处理
 */
+ (void)SearchUserWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block keywords:(NSString *)keywords startIndex:(int)startIndex noNetWork:(void(^)())noNetWork;

@end
