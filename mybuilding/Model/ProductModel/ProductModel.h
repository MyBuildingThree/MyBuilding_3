//
//  ProductModel.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  产品的数据处理
 */
@interface ProductModel : NSObject
/**
 *  产品的ID
 */
@property (nonatomic,strong) NSString *a_productID;

/**
 *  产品的名字
 */
@property (nonatomic,strong) NSString *a_productName;

/**
 *  产品的简介
 */
@property (nonatomic,strong) NSString *a_productDesc;

/**
 *  产品列表小图
 */
@property (nonatomic,strong) NSURL *a_productListSmallImageUrl;

/**
 *  产品原图
 */
@property (nonatomic,strong) NSURL *a_productOriginImageUrl;

/**
 *  原图按屏幕宽度等比缩小的宽
 */
@property (nonatomic) float a_imageWidth;

/**
 *  原图按屏幕宽度等比缩小的高
 */
@property (nonatomic) float a_imageHeight;

/**
 *  产品评论数
 */
@property (nonatomic,strong) NSString *a_commentNumber;

/**
 *  产品发布时间
 */
@property (nonatomic,strong) NSString *a_createdBy;

/**
 *  发产品用户头像
 */
@property (nonatomic, strong) NSURL *a_avatarUrl;

/**
 *  发产品用户姓名
 */
@property (nonatomic, strong) NSString *a_userName;

/**
 *  产品是否被关注
 */
@property (nonatomic) BOOL a_isFocused;

/**
 *  产品关注数
 */
@property (nonatomic, strong) NSString *a_focusedNum;

/**
 *  用户类型 01是个人 02是公司
 */
@property(nonatomic,strong)NSString* a_userType;
@property (nonatomic, strong) NSDictionary *dict;
@end
