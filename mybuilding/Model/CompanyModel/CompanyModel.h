//
//  CompanyModel.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  公司的项目处理
 */
@interface CompanyModel : NSObject
/**
 *  公司ID
 */
@property (nonatomic,strong) NSString *a_companyID;

/**
 *  公司名字
 */
@property (nonatomic,strong) NSString *a_companyName;

/**
 *  公司行业
 */
@property (nonatomic,strong) NSString *a_companyIndustry;

/**
 *  公司被关注数
 */
@property (nonatomic,strong) NSString *a_companyFocusNumber;

/**
 *  公司员工数
 */
@property (nonatomic,strong) NSString *a_companyEmployeeNumber;

/**
 *  公司简介
 */
@property (nonatomic,strong) NSString *a_companyDescription;

/**
 *  公司图片
 */
@property (nonatomic,strong) NSURL *a_companyLogo;

/**
 *  是否被关注
 */
@property (nonatomic) BOOL a_focused;

/**
 *  公司联系人
 */
@property (nonatomic,strong) NSString *a_companyContactName;

/**
 *  公司联系人电话
 */
@property (nonatomic,strong) NSString *a_companyContactCellphone;

/**
 *  公司联系人邮箱
 */
@property (nonatomic,strong) NSString *a_companyContactEmail;

/**
 *  公司所在地
 */
@property (nonatomic,strong) NSString *a_companyLocation;

/**
 *  省
 */
@property (nonatomic,strong) NSString *a_companyProvince;

/**
 *  市
 */
@property (nonatomic,strong) NSString *a_companyCity;

/**
 *  区
 */
@property (nonatomic,strong)NSString *a_companyDistrict;

/**
 *  是否申请认证
 */
@property (nonatomic,strong) NSString *a_reviewStatus;

/**
 *  所有产品数
 */
@property(nonatomic,strong)NSString *a_productNum;

/**
 *  所有项目数
 */
@property(nonatomic,strong)NSString *a_projectNum;

@property (nonatomic, strong) NSDictionary *dict;
@end
