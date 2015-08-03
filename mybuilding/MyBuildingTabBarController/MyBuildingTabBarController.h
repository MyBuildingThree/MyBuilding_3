//
//  MyBuildingTabBarController.h
//  TEMP
//
//  Created by ShenjiGroup on 15/7/29.
//  Copyright (c) 2015年 ShenjiGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyBuildingTabBarController : UITabBarController

/**
 *  底栏背景视图
 */
@property (nonatomic, strong)UIImageView *bgImageView;

/**
 *  底栏的单例方法
 *
 *  @return 返回底栏
 */
+ (MyBuildingTabBarController *)sharedTabbarController;

@end
