//
//  RecommendModel.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductModel.h"
#import "ProjectModel.h"
#import "PersonModel.h"
#import "CompanyModel.h"

/**
 *  处理推荐的数据
 */
@interface RecommendModel : NSObject
/**
 *  项目的数据处理 ProjectModel
 */
@property(nonatomic,strong)ProjectModel *a_projectModel;

/**
 *  产品的数据处理 ProductModel
 */
@property(nonatomic,strong)ProductModel *a_productModel;

/**
 *  公司的数据处理 CompanyModel
 */
@property(nonatomic,strong)CompanyModel *a_companyModel;

/**
 *  人的数据处理 PersonModel
 */
@property(nonatomic,strong)PersonModel *a_personModel;

/**
 *  判断数据类型 个人 1，公司 2，项目 3，产品	4，需求 5
 */
@property(nonatomic)int a_sourceType;
@property(nonatomic,strong)NSDictionary *dict;
@end
