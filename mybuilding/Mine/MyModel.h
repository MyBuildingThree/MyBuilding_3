//
//  MyModel.h
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

/**
 *  个人信息
 */
@property (nonatomic,strong)NSMutableDictionary *personDic;

/**
 *  积分和兑换
 */
@property (nonatomic,strong)NSMutableDictionary *integralDic;

/**
 *  合同情况(进行,完成,关闭)
 */
@property (nonatomic,strong)NSMutableDictionary *contractDic;

/**
 *  关注(项目,人,公司,产品)
 */
@property (nonatomic,strong)NSMutableDictionary *attentionDic;

/**
 *  其他
 */
@property (nonatomic,strong)NSMutableDictionary *otherDic;

@end
