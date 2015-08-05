//
//  ProjectContactModel.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  处理项目详情联系人数据
 */
@interface ProjectContactModel : NSObject
/**
 *  联系人ID
 */
@property (nonatomic,strong) NSString *a_contactID;

/**
 *  联系人姓名
 */
@property (nonatomic,strong) NSString *a_contactName;

/**
 *  联系人电话
 */
@property (nonatomic,strong) NSString *a_mobilePhone;

/**
 *  单位名称
 */
@property (nonatomic,strong) NSString *a_accountName;

/**
 *  单位地址
 */
@property (nonatomic,strong) NSString *a_accountAddress;

/**
 *  联系人所在项目ID
 */
@property (nonatomic,strong) NSString *a_projectId;

/**
 *  联系人所在项目名字
 */
@property (nonatomic,strong) NSString *a_projectName;

/**
 *  联系人的岗位
 */
@property (nonatomic,strong) NSString *a_duties;

/**
 *  联系人的类型
 */
@property (nonatomic,strong) NSString *a_category;

@property (nonatomic, copy) NSDictionary *dict;
@end
