//
//  LoginModel.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  用户的数据处理
 */
@interface LoginModel : NSObject
/**
 *  用户ID
 */
@property(nonatomic,copy)NSString *a_userID;

/**
 *  用户名
 */
@property(nonatomic,copy)NSString *a_userName;

/**
 *  用户token
 */
@property(nonatomic,copy)NSString *a_token;

/**
 *  用户头像路径
 */
@property(nonatomic,copy)NSURL *a_userAvatarUrl;

/**
 *  用户电话
 */
@property(nonatomic,copy)NSString *a_phone;

/**
 *  用户类型 01是个人用户 02是公司用户
 */
@property(nonatomic,copy)NSString *a_userType;

/**
 *  用户是否有公司认证
 */
@property(nonatomic)BOOL a_hasCompany;

/**
 *  公司联系人姓名
 */
@property(nonatomic,copy)NSString *a_companyContactName;

/**
 *  公司联系人电话
 */
@property(nonatomic,copy)NSString *a_companyContactPhone;

@property(nonatomic,strong)NSDictionary *dict;
@end
