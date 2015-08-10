//
//  CommentModel.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/10.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  处理评论的数据
 */
@interface CommentModel : NSObject
/**
 *  评论的ID
 */
@property (nonatomic, copy) NSString *a_id;

/**
 *  评论对象的ID
 */
@property (nonatomic, copy) NSString *a_entityId;

/**
 *  评论人的名字
 */
@property (nonatomic, copy) NSString *a_userName;

/**
 *  评论内容
 */
@property (nonatomic, copy) NSString *a_commentContents;

/**
 *  头像
 */
@property (nonatomic, copy) NSURL *a_avatarUrl;

/**
 *  评论人的账号类型
 */
@property (nonatomic, copy) NSString *a_userType;

/**
 *  评论创建时间
 */
@property (nonatomic, copy) NSString *a_createdTime;

/**
 *  评论人的ID
 */
@property (nonatomic,copy)NSString *a_loginId;

@property (nonatomic, copy) NSDictionary *dict;
@end
