//
//  ADScrollView.h
//  MZeroDemo
//
//  Created by ShenjiGroup on 15/7/31.
//  Copyright (c) 2015年 ShenjiGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADScrollView : UIScrollView

/**
 *  显示广告页面点击进行相应的web跳转
 *
 *  @param imageUrlArray 广告图片地址
 *  @param webUrlArray   跳转的web地址
 */
+ (void)showADwithImageUrlArray:(NSArray *)imageUrlArray jumpToWebUrl:(NSArray *)webUrlArray;

@end
