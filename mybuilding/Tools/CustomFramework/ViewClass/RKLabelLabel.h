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
 *  @param height 固定整个控件的高度，当(maxWidth != 0)时height无效，控件高度不再固定
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
 *  第二边距，firstLabel与secondLabel之间的，当(direction == RKImageLabelDirectionBottom)时且maxWidth不为0时有效
 */
@property(nonatomic, assign) CGFloat secondMargin;

/**
 *  第三边距
 */
@property(nonatomic, assign) CGFloat thirdMargin;

/**
 *  设定之后labelLabel宽度强制为maxWidth，一旦设置，默认所有label全部为限宽不限高类型
 */
@property(nonatomic, assign) CGFloat maxWidth;

/**
 *  设置firstMaxHeight必须要设置maxWidth，firstLabel的最大高度
 */
@property(nonatomic, assign) CGFloat firstMaxHeight;

/**
 *  设置secondMaxHeight必须要设置maxWidth，secondLabel的最大高度
 */
@property(nonatomic, assign) CGFloat secondMaxHeight;

@end
