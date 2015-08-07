//
//  ProjectNameInfoView.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ProjectNameInfoViewDelegate <NSObject>

/**
 *  获取ProjectNameInfoView的数据
 *
 *  @param contents 依次为项目名称，项目描述，收藏，评论数，关注数，时间
 */
- (void)projectNameInfoViewWithContents:(NSArray*)contents;

@end

/**
 *  项目详情项目名称等各信息
 */
@interface ProjectNameInfoView : UIView

@property(nonatomic, weak) id<ProjectNameInfoViewDelegate> delegate;

/**
 *  设置各参数
 *
 *  @param name        项目名称
 *  @param describe    项目描述
 *  @param favoriteNum 收藏数
 *  @param commentNum  评论数
 *  @param focusNum    关注数
 *  @param time        时间
 */
- (void)setName:(NSString*)name describe:(NSString*)describe favoriteNum:(NSString*)favoriteNum commentNum:(NSString*)commentNum focusNum:(NSString*)focusNum time:(NSString*)time;

@end
