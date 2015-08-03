//
//  HomeNavigationController.h
//  TEMP
//
//  Created by ShenjiGroup on 15/7/29.
//  Copyright (c) 2015年 ShenjiGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeNavigationController : UINavigationController

/**
 *  导航栏的单例方法
 *
 *  @return 返回导航栏控制器
 */
+ (HomeNavigationController *)sharedHomeNavigationController;

/**
 *  恢复导航条上的初始子控件(搜索 和 更多功能)
 */
- (void)recoverInitialSubviews;

/**
 *  移除导航条上的初始控件
 */
- (void)removeSubviews;


@end
