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
@property(nonatomic,strong)NSString *a_id;
@property(nonatomic,strong)NSString *a_loginName;
@property(nonatomic,strong)NSString *a_avatarUrl;
@property(nonatomic,strong)NSString *a_loginId;
@property(nonatomic,strong)NSString *a_createdTime;
@property(nonatomic,strong)NSString *a_reqTypeCn;
@property(nonatomic,strong)NSString *a_address;
@property(nonatomic,strong)NSString *a_reqDesc;
@property(nonatomic,strong)NSString *a_money;
@property(nonatomic,strong)NSString *a_bigTypeCn;
@property(nonatomic,strong)NSString *a_smallTypeCn;
@property(nonatomic,strong)NSString *a_commentCount;
@property(nonatomic,strong)NSString *a_city;
@end
