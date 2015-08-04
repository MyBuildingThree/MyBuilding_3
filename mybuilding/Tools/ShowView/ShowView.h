//
//  ShowView.h
//  mybuilding
//
//  Created by MZero on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowView : UIView

/**
*  弹出提醒视图
*
*  @param frame      弹出视图的frame
*  @param color      视图的背景颜色
*  @param titleStr   视图上文字内容
*  @param titleColor 文字颜色
*  @param fsize      文字大小
*  @param time       动画持续时间
*  @param completion 完成以后的动作
*/
+(void)showAtFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor title:(NSString *)titleStr titleColor:(UIColor *)titleColor titleFontOfSize:(CGFloat)fsize animateWithDuration:(NSTimeInterval)time completion:(void(^)())completion;

@end
