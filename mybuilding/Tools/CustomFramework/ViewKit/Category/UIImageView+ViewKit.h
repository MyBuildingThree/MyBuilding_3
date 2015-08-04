//
//  UIImageView+ViewKit.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ViewKit)
/**
 *  设置成圆形的
 *
 *  @param isRound 是否需要变成圆形，NO的话则为方形
 */
- (void)setIsRound:(BOOL)isRound;

/**
 *  设置圆角半径
 *
 *  @param cornerRadius 半径长度
 */
- (void)setCornerRadius:(CGFloat)cornerRadius;
@end
