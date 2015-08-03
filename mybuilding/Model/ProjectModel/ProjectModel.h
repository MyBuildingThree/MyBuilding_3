//
//  ProjectModel.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  项目的数据处理
 */
@interface ProjectModel : NSObject
/**
 *  项目ID
 */
@property(nonatomic,copy)NSString *a_projectID;

/**
 *  项目名字
 */
@property(nonatomic,copy)NSString *a_projectName;

/**
 *  最后更新时间
 */
@property(nonatomic,strong) NSString *a_lastUpdatedTime;

/**
 *  评论数
 */
@property(nonatomic,strong) NSString *a_commentsNum;

/**
 *  地块名称
 */
@property (nonatomic,strong) NSString *a_landName;

/**
 *  所在区域
 */
@property (nonatomic,strong) NSString *a_district;

/**
 *  所在省市
 */
@property (nonatomic,strong) NSString *a_province;

/**
 *  所在区域
 */
@property (nonatomic,strong) NSString *a_city;

/**
 *  地块地址（项目地址）
 */
@property (nonatomic,strong) NSString *a_landAddress;

/**
 *  土地面积
 */
@property (nonatomic,strong) NSString *a_area;

/**
 *  土地容积率
 */
@property (nonatomic,strong) NSString *a_plotRatio;

/**
 *  地块用途
 */
@property (nonatomic,strong) NSString *a_usage;

/**
 *  项目描述
 */
@property (nonatomic,strong) NSString *a_description;

/**
 *  预计开工时间
 */
@property (nonatomic,strong) NSString *a_exceptStartTime;

/**
 *  预计竣工时间
 */
@property (nonatomic,strong) NSString *a_exceptFinishTime;

/**
 *  投资额
 */
@property (nonatomic,strong) NSString *a_investment;

/**
 *  建筑面积
 */
@property (nonatomic,strong) NSString *a_storeyArea;

/**
 *  建筑层高
 */
@property (nonatomic,strong) NSString *a_storeyHeight;

/**
 *  外资参与
 */
@property (nonatomic,strong) NSString *a_foreignInvestment;

/**
 *  业主类型
 */
@property (nonatomic,strong) NSString *a_ownerType;

/**
 *  经度
 */
@property (nonatomic,strong) NSString *a_longitude;

/**
 *  纬度
 */
@property (nonatomic,strong) NSString *a_latitude;

/**
 *  主体设计阶段
 */
@property (nonatomic,strong) NSString *a_mainDesignStage;

/**
 *  电梯
 */
@property (nonatomic,strong) NSString *a_elevator;

/**
 *  空调
 */
@property (nonatomic,strong) NSString *a_airCondition;

/**
 *  供暖
 */
@property (nonatomic,strong) NSString *a_heating;

/**
 *  外墙材料
 */
@property (nonatomic,strong) NSString *a_externalWallMeterial;

/**
 *  钢结构
 */
@property (nonatomic,strong) NSString *a_stealStructure;

/**
 *  实际开工时间
 */
@property (nonatomic,strong) NSString *a_actureStartTime;

/**
 *  消防
 */
@property (nonatomic,strong) NSString *a_fireControl;

/**
 *  景观绿化
 */
@property (nonatomic,strong) NSString *a_green;

/**
 *  弱电安装
 */
@property (nonatomic,strong) NSString *a_electorWeakInstallation;

/**
 *  装修情况
 */
@property (nonatomic,strong) NSString *a_decorationSituation;

/**
 *  装修进度
 */
@property (nonatomic,strong) NSString *a_decorationProcess;
@end
