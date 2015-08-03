//
//  UIView+ViewKit.h
//  RKKit
//
//  Created by 孙元侃 on 15/7/29.
//  Copyright (c) 2015年 孙元侃. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIView的分类，集成各种常用及麻烦的方法进行封装
 */
@interface UIView (ViewKit)

@property(nonatomic, readonly) CGFloat minX;//最左的x值
@property(nonatomic, readonly) CGFloat midX;//中间的x值
@property(nonatomic, readonly) CGFloat maxX;//最右的x值

@property(nonatomic, readonly) CGFloat minY;//最高的y值
@property(nonatomic, readonly) CGFloat midY;//中间的y值
@property(nonatomic, readonly) CGFloat maxY;//最低的y值

@property(nonatomic, readonly) CGFloat width;//宽度
@property(nonatomic, readonly) CGFloat height;//高度

@property(nonatomic, readonly) CGFloat halfWidth;//一半的宽度
@property(nonatomic, readonly) CGFloat halfHeight;//一半的高度

@property(nonatomic, readonly) CGPoint internalCenter;//视图内部的center

/**
 *  设置最左的x
 *  @return 设置完之后的view.frame
 */
- (CGRect)setMinX:(CGFloat)minX;

/**
 *  设置最高的y
 *  @return 设置完之后的view.frame
 */
- (CGRect)setMinY:(CGFloat)minY;

/**
 *  设置中间的x
 *  @return 设置完之后的view.frame
 */
- (CGRect)setMidX:(CGFloat)midX;

/**
 *  设置中间的y
 *  @return 设置完之后的view.frame
 */
- (CGRect)setMidY:(CGFloat)midY;


typedef enum{
    RKViewArrangeAlignmentLeft,
    RKViewArrangeAlignmentRight,
    RKViewArrangeAlignmentTop,
    RKViewArrangeAlignmentBottom,
    RKViewArrangeAlignmentMid
}RKViewArrangeAlignment;

typedef enum{
    RKViewArrangeDirectionRight,
    RKViewArrangeDirectionLeft,
    RKViewArrangeDirectionBottom,
    RKViewArrangeDirectionTop
}RKViewArrangeDirection;
/**
 *  水平排列所有view，distances传递他们之间的距离，第一个distance为第一个view到左边的距离
 */
+ (void)horizontalArrangeViews:(NSArray*)/*UIView*/views distances:(NSArray*)/*NSString*/distances alignmentType:(RKViewArrangeAlignment)alignment direction:(RKViewArrangeDirection)direction;

/**
 *  垂直排列所有view，多参传递他们之间的距离，多参数量为views.count-1
 */
+ (void)verticalArrangeViewsAndDistance:(NSArray*)/*UIView*/views,/*CGFloat*/...;
@end
