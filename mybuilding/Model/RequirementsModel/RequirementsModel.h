//
//  RequirementsModel.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  处理需求的数据
 */
@interface RequirementsModel : NSObject
/**
 *  需求ID
 */
@property(nonatomic,strong)NSString *a_reqID;

/**
 *  发需求的人姓名
 */
@property(nonatomic,strong)NSString *a_loginName;

/**
 *  发需求的人头像
 */
@property(nonatomic,strong)NSURL *a_avatarUrl;

/**
 *  发需求的人ID
 */
@property(nonatomic,strong)NSString *a_loginId;

/**
 *  发需求时间
 */
@property(nonatomic,strong)NSString *a_createdTime;

/**
 *  需求的类型文字
 */
@property(nonatomic,strong)NSString *a_reqTypeCn;

/**
 *  所在地
 */
@property(nonatomic,strong)NSString *a_address;

/**
 *  需求描述
 */
@property(nonatomic,strong)NSString *a_reqDesc;

/**
 *  金额
 */
@property(nonatomic,strong)NSString *a_money;

/**
 *  大类
 */
@property(nonatomic,strong)NSString *a_bigTypeCn;

/**
 *  小类
 */
@property(nonatomic,strong)NSString *a_smallTypeCn;

/**
 *  评论数
 */
@property(nonatomic,strong)NSString *a_commentCount;

/**
 *  需求类型: 找项目 1,找材料 2,找关系 3,找合作 4,其他 5
 */
@property(nonatomic)int a_reqType;

/**
 *  城市
 */
@property(nonatomic,strong)NSString *a_city;

@property(nonatomic,strong)NSDictionary *dict;
@end
