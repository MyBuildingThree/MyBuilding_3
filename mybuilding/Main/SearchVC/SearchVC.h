//
//  SearchVC.h
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchVC : UIViewController

/**
 *  进入搜索界面
 *
 *  @param classArray 分类字符串的数组
 *  @param nc         导航控制器
 */
+ (void)searchWithClass:(NSArray *)classArray pushBy:(UINavigationController *)nc;

@end
