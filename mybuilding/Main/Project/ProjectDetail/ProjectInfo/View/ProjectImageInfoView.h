//
//  ProjectImageInfoView.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProjectImageInfoView;

@protocol ProjectImageInfoViewDelegate <NSObject>

@optional

/**
 *  imageInfoView被点击时触发
 *
 *  @param imageInfoView 自身
 */
- (void)imageInfoViewClicked:(ProjectImageInfoView *)imageInfoView;

@end

/**
 *  项目详情图片视图
 */
@interface ProjectImageInfoView : UIImageView

/**
 *  设置图片url和图片数量
 *
 *  @param imageUrl 图片url
 *  @param imageNum 图片数量
 */
- (void)setImageUrl:(NSURL *)imageUrl imageNum:(NSString *)imageNum;

@property(nonatomic, weak) id<ProjectImageInfoViewDelegate> delegate;

@end
