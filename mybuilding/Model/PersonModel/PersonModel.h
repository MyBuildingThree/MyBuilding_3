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
 *  认证公司
 */
@property(nonatomic,copy)NSString *a_approveCompanyName;

/**
 *  认证公司行业
 */
@property(nonatomic,copy)NSString *a_industry;

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

/**
 *  真实姓名
 */
@property(nonatomic,strong)NSString *a_realName;

/**
 *  性别
 */
@property(nonatomic,strong)NSString *a_sex;

/**
 *  所在地
 */
@property(nonatomic,strong)NSString *a_address;

/**
 *  生日
 */
@property(nonatomic,strong)NSString *a_birthday;

/**
 *  星座
 */
@property(nonatomic,strong)NSString *a_constel;

/**
 *  血型
 */
@property(nonatomic,strong)NSString *a_bloodType;

/**
 *  邮箱
 */
@property(nonatomic,strong)NSString *a_email;

/**
 *  手机
 */
@property(nonatomic,strong)NSString *a_loginTel;

/**
 *  省
 */
@property(nonatomic,strong)NSString *a_province;

/**
 *  市
 */
@property(nonatomic,strong)NSString *a_city;

/**
 *  区
 */
@property(nonatomic,strong)NSString *a_district;

/**
 *  所有产品的数量
 */
@property(nonatomic,strong)NSString *a_productNum;

/**
 *  所有项目的数量
 */
@property(nonatomic,strong)NSString *a_projectNum;

/**
 *  是否有工作经历
 */
@property(nonatomic)BOOL a_isWorkHistory;

/**
 *  是否有认证公司
 */
@property(nonatomic)BOOL a_isCompany;

/**
 *  开始工作时间
 */
@property(nonatomic,strong)NSString *a_startTime;

/**
 *  结束工作时间
 */
@property(nonatomic,strong)NSString *a_endTime;

/**
 *  工作介绍
 */
@property(nonatomic,strong)NSString *a_workDesc;

/**
 *  是否还在这家公司
 */
@property(nonatomic)BOOL a_isWorking;

@property(nonatomic,strong)NSDictionary *dict;
@end
