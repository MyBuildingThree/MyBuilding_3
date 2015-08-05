//
//  RKImageView.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RKImageView;
@protocol RKImageViewDelegate <NSObject>
@optional
/**
 *  imageView的frame改变时触发
 *
 *  @param imageView 被改变的imageView
 *  @param frame     改变后的imageView.frame
 */
- (void)imageView:(RKImageView*)imageView changeFrame:(CGRect)frame;

/**
 *  imageView的image改变时触发
 *
 *  @param imageView 被改变的imageView
 *  @param frame     改变后的imageView.image
 */
- (void)imageView:(RKImageView*)imageView changeImage:(UIImage*)image;
@end

@interface RKImageView : UIImageView
@property(nonatomic, weak) id<RKImageViewDelegate> delegate;
@end
