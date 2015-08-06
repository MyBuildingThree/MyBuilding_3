//
//  RKImageLabel.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RKImageLabel;
@protocol RKImageLabelDelegate <NSObject>

/**
 *  imageLabel被点击时的委托
 *
 *  @param imageLabel 自身
 */
- (void)imageLabelClicked:(RKImageLabel *)imageLabel;

@end

/**
 *  以下方向均以imageView为第一元素，label为第二元素进行方向排列
 */
typedef enum{
    RKImageLabelDirectionRight,//imageView在左，label在右
    RKImageLabelDirectionBottom//imageView在上，label在下
}RKImageLabelDirection;

/**
 *  带图片的label并有自适应功能
 */
@interface RKImageLabel : UIView

/**
 *  通过高度进行创建,默认RKImageLabelDirectionRight
 *
 *  @param height 整个控件的高度
 *
 *  @return imageLabel
 
 示例代码：
 
 RKImageLabel* imageLabel = [RKImageLabel imageLabelWithHeight:50];
 imageLabel.backgroundColor = [UIColor redColor];
 imageLabel.imageView.frame = CGRectMake(0, 0, 30, 30);
 imageLabel.imageView.backgroundColor = [UIColor greenColor];
 imageLabel.mainLabel.text = @"111";
 imageLabel.mainLabel.backgroundColor = [UIColor orangeColor];
 imageLabel.firstMargin = 100;
 imageLabel.secondMargin = 100;
 imageLabel.thirdMargin = 10;
 
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    imageLabel.imageView.frame = CGRectMake(0, 0, 100, 40);
    imageLabel.mainLabel.text = @"1111hhh111";
    imageLabel.mainLabel.font = [UIFont systemFontOfSize:28];
    imageLabel.firstMargin = 20;
    imageLabel.secondMargin = 50;
    imageLabel.thirdMargin = 50;
 });
 [self.view addSubview:imageLabel];
 */
+ (instancetype)imageLabelWithHeight:(CGFloat)height;

/**
 *  通过高度进行创建
 *
 *  @param height    整个控件的高度
 *  @param direction 排列方向，如果为RKImageLabelDirectionRight，等价于imageLabelWithHeight:方法
 *
 *  @return imageLabel
 
 示例代码(direction == RKImageLabelDirectionBottom的情况)：
 
 RKImageLabel* imageLabel = [RKImageLabel imageLabelWithHeight:100 direction:RKImageLabelDirectionBottom];
 imageLabel.minY = 100;
 imageLabel.backgroundColor = [UIColor redColor];
 imageLabel.imageView.frame = CGRectMake(0, 0, 20, 20);
 imageLabel.imageView.backgroundColor = [UIColor greenColor];
 imageLabel.mainLabel.text = @"111";
 imageLabel.mainLabel.backgroundColor = [UIColor orangeColor];
 imageLabel.firstMargin = 10;
 imageLabel.secondMargin = 100; //无效
 imageLabel.thirdMargin = 10;
 
 
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    imageLabel.imageView.frame = CGRectMake(0, 0, 10, 10);
    imageLabel.mainLabel.text = @"1111hhh111";
    imageLabel.mainLabel.font = [UIFont systemFontOfSize:28];
    imageLabel.firstMargin = 5;
    imageLabel.secondMargin = 999; //无效
    imageLabel.thirdMargin = 20;
 });
 [self.view addSubview:imageLabel];
 */
+ (instancetype)imageLabelWithHeight:(CGFloat)height direction:(RKImageLabelDirection)direction;

/**
 *  label部分
 */
@property(nonatomic, strong, readonly) UILabel* mainLabel;

/**
 *  imageView部分
 */
@property(nonatomic, strong, readonly) UIImageView* imageView;

/**
 *  第一边距
 */
@property(nonatomic, assign) CGFloat firstMargin;

/**
 *  第二边距，imageView与label之间的，当direction == RKImageLabelDirectionBottom时，该属性无效
 */
@property(nonatomic, assign) CGFloat secondMargin;

/**
 *  第三边距
 */
@property(nonatomic, assign) CGFloat thirdMargin;

/**
 *  该属性目前只支持(direction == RKImageLabelDirectionBottom)的情况
 *  可被点击区域，一旦被设置，imageLabel的size会强制为该值，效果可以理解为将没设置canClickedSize前的那个视图的center放到新的被设置完的center上
 */
@property(nonatomic, assign) CGSize canClickedSize;

@property(nonatomic, weak) id<RKImageLabelDelegate> delegate;

@end
