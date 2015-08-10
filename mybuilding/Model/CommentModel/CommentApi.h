//
//  CommentApi.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/10.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  评论的接口
 */
@interface CommentApi : NSObject
/**
 *  获取评论列表接口 get
 *
 *  @param block      接口返回的数据 CommentModel
 *  @param entityId   评论对象的ID
 *  @param entityType 评论的类型 
 *  @param startIndex 分页 从0开始
 *  @param noNetWork  没有网络的情况处理
 */
+ (void)GetEntityCommentsWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block entityId:(NSString *)entityId entityType:(NSString *)entityType startIndex:(int)startIndex noNetWork:(void(^)())noNetWork;
@end
