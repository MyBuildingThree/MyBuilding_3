//
//  RKImageLabel.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  带图片的label并有自适应功能
 示例代码：
 RKImageLabel* imageLabel = [RKImageLabel imageLabelWithHeight:50];
 imageLabel.backgroundColor = [UIColor redColor];
 imageLabel.imageView.frame = CGRectMake(0, 0, 30, 30);
 imageLabel.imageView.backgroundColor = [UIColor greenColor];
 imageLabel.mainLabel.text = @"111";
 imageLabel.mainLabel.backgroundColor = [UIColor orangeColor];
 imageLabel.leftMargin = 100;
 imageLabel.centerMargin = 100;
 imageLabel.rightMargin = 10;
 
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    imageLabel.imageView.frame = CGRectMake(0, 0, 100, 40);
    imageLabel.mainLabel.text = @"1111hhh111";
    imageLabel.mainLabel.font = [UIFont systemFontOfSize:28];
    imageLabel.leftMargin = 20;
    imageLabel.centerMargin = 50;
    imageLabel.rightMargin = 50;
 });
 [self.view addSubview:imageLabel];
 */
@interface RKImageLabel : UIView

/**
 *  通过高度进行创建
 *
 *  @param height 整个控件的高度
 *
 *  @return imageLabel
 */
+ (instancetype)imageLabelWithHeight:(CGFloat)height;

/**
 *  label部分
 */
@property(nonatomic, strong, readonly) UILabel* mainLabel;

/**
 *  imageView部分
 */
@property(nonatomic, strong, readonly) UIImageView* imageView;

/**
 *  左边距,
 */
@property(nonatomic, assign) CGFloat leftMargin;

/**
 *  中间边距，imageView与label之间的
 */
@property(nonatomic, assign) CGFloat centerMargin;

/**
 *  右边距
 */
@property(nonatomic, assign) CGFloat rightMargin;

@end
