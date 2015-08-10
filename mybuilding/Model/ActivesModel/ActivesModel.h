//
//  ActivesModel.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/10.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  处理动态的数据
 */
@interface ActivesModel : NSObject
/**
 *  动态的id
 */
@property (nonatomic, copy) NSString *a_id;

/**
 *  发动态人的头像
 */
@property (nonatomic, copy) NSString *a_dynamicAvatarUrl;

/**
 *  发动态人的名字
 */
@property (nonatomic, copy) NSString *a_dynamicLoginName;

/**
 *  发动态人的id
 */
@property (nonatomic, copy) NSString *a_dynamicLoginId;

/**
 *  发动态人的类型
 */
@property (nonatomic, copy) NSString *a_dynamicUserType;

/**
 *  发动态的人是否是个人
 */
@property (nonatomic) BOOL a_isPersonal;

/**
 *  发动态时间
 */
@property (nonatomic, copy) NSDate *a_time;

/**
 *  动态小图
 */
@property (nonatomic, copy) NSString *a_imageUrl;

/**
 *  动态大图
 */
@property (nonatomic, copy) NSString *a_bigImageUrl;

/**
 *  动态原图的宽
 */
@property (nonatomic, copy) NSString *a_imageWidth;

/**
 *  动态原图的高
 */
@property (nonatomic, copy) NSString *a_imageHeight;
//动态的评论
@property (nonatomic, strong) NSMutableArray *a_commentsArr;
//动态评论的数量
@property (nonatomic) NSInteger a_commentNum;
//动态产生对象的id 如项目被评论 这个项目的id
@property (nonatomic, copy) NSString *a_entityId;

//动态里项目的信息
@property (nonatomic, copy) NSString *a_projectName;
@property (nonatomic, copy) NSString *a_projectStage;
@property (nonatomic, copy) NSString *a_projectCity;
@property (nonatomic, copy) NSString *a_projectAddress;

//动态里产品的信息
@property (nonatomic, copy) NSString *a_productName;
@property (nonatomic,copy)NSString* a_productImage;
@property (nonatomic,copy)NSString* a_bigProductImage;
@property (nonatomic,copy)NSString *a_productDesc;
@property (nonatomic,copy)NSString *a_productImageWidth;
@property (nonatomic,copy)NSString *a_productImageHeight;
@property (nonatomic,copy)NSString *a_landAddress;
@property (nonatomic,copy)NSString *a_landProvince;
@property (nonatomic,copy)NSString *a_landCity;
@property (nonatomic,copy)NSString *a_landDistrict;


//operationCode : 00 表示发动态 01 表示发产品 02 表示发项目 03 表示被修改 04表示被评论 05 表示被认证
@property (nonatomic, copy) NSString *a_operationCode;
//sourceCode : 00 表示个人 01 表示公司 02 表示项目 03 表示产品
@property (nonatomic, copy) NSString *a_sourceCode;

/**********************************
 0 个人/公司 发布了动态
 1 个人/公司 发布了产品
 2 个人/公司 发布了项目
 3 个人/公司 修改了个人资料
 4 个人 被公司认证通过
 5 项目被修改了
 6 项目被评论了
 7 产品被评论了
 **********************************/
@property (nonatomic)NSInteger a_type;

@property (nonatomic, copy) NSString *a_title;
@property (nonatomic, copy) NSString *a_content;

@property (nonatomic, copy) NSDictionary *dict;
@end
