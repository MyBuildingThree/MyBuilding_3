//
//  ProductApi.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  和产品有关的接口
 */
@interface ProductApi : NSObject
/**
 *  获取和搜索产品列表 get
 *
 *  @param block       接口返回的数据 PersonModel
 *  @param startIndex  分页 从0开始
 *  @param productDesc 搜索的关键字
 *  @param userId      创建产品的用户ID
 *  @param productIds  产品ID串
 *  @param noNetWork   没有网络的情况处理
 */
+ (void)GetProductListWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block startIndex:(int)startIndex productDesc:(NSString *)productDesc userId:(NSString *)userId productIds:(NSString *)productIds noNetWork:(void(^)())noNetWork;
@end
