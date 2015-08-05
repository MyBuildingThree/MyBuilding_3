//
//  RKLabelLabel.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RKLabelLabel;

/**
 *  以下方向均以firstLabel为第一元素，secondlabel为第二元素进行方向排列
 */
typedef enum{
    RKLabelLabelDirectionRight,//firstLabel在左，secondlabel在右，不可用
    RKLabelLabelDirectionBottom//firstLabel在上，secondlabel在下，可用
}RKLabelLabelDirection;

/**
 *  带两个label并有自适应功能
 */
@interface RKLabelLabel : UIView

/**
 *  通过高度进行创建,默认RKLabelLabelDirectionBottom
 *
 *  @param height 整个控件的高度
 *
 *  @return imageLabel
 */
+ (instancetype)labelLabelWithHeight:(CGFloat)height;

/**
 *  firstLabel部分
 */
@property(nonatomic, strong, readonly) UILabel* firstLabel;

/**
 *  secondLabel部分
 */
@property(nonatomic, strong, readonly) UILabel* secondLabel;

/**
 *  第一边距
 */
@property(nonatomic, assign) CGFloat firstMargin;

/**
 *  第二边距，firstLabel与secondLabel之间的，当direction == RKImageLabelDirectionBottom时，该属性无效
 */
//@property(nonatomic, assign) CGFloat secondMargin;

/**
 *  第三边距
 */
@property(nonatomic, assign) CGFloat thirdMargin;

@end
