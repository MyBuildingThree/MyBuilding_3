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

/**
 *  是否签到过
 */
@property(nonatomic)BOOL a_isSign;

/**
 *  我的积分
 */
@property(nonatomic,strong)NSString *a_points;

/**
 *  兑换记录
 */
@property(nonatomic,strong)NSString *a_exchangeNum;

/**
 *  进行中合同的数量
 */
@property(nonatomic,strong)NSString *a_contractNum_begin;

/**
 *  已完成合同的数量
 */
@property(nonatomic,strong)NSString *a_contractNum_end;

/**
 *  关闭合同的数量
 */
@property(nonatomic,strong)NSString *a_contractNum_close;

/**
 *  关注的项目数量
 */
@property(nonatomic,strong)NSString *a_focusProjectNum;

/**
 *  关注的人数量
 */
@property(nonatomic,strong)NSString *a_focusPersonNum;

/**
 *  关注的产品数量
 */
@property(nonatomic,strong)NSString *a_focusProductNum;

/**
 *  关注的公司数量
 */
@property(nonatomic,strong)NSString *a_focusCompanyNum;

@property(nonatomic,strong)NSDictionary *dict;
@end
