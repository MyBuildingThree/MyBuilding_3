//
//  RecommendApi.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  和推荐有关的接口
 */
@interface RecommendApi : NSObject
/**
 *  推荐列表接口
 *
 *  @param block      接口返回的数据 RecommendModel
 *  @param startIndex 分页 从0开始
 *  @param noNetWork  没有网络的情况处理
 */
+(void)getAllRecommendInfo:(void (^)(NSMutableArray *posts, NSError *error))block startIndex:(NSInteger)startIndex noNetWork:(void(^)())noNetWork;
@end
