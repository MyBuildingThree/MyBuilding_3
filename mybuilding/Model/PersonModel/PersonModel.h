//
//  PersonModel.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject
/**
 *  人id
 */
@property(nonatomic,copy)NSString *a_id;

/**
 *  用户名
 */
@property(nonatomic,copy)NSString *a_name;

/**
 *  公司名称
 */
@property(nonatomic,copy)NSString *a_companyName;

/**
 *  职位
 */
@property(nonatomic,copy)NSString *a_duties;


/**
 *  用户头像url
 */
@property(nonatomic,strong)NSURL *a_avatarUrl;

/**
 *  是否是好友
 */
@property(nonatomic)BOOL a_isFriend;

/**
 *  好友申请是否在等待中
 */
@property(nonatomic)BOOL a_isWaiting;

@property(nonatomic,strong)NSDictionary *dict;
@end
