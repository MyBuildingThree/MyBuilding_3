//
//  PopoverView.h
//  ArrowView
//
//  Created by guojiang on 4/9/14.
//  Copyright (c) 2014年 LINAICAI. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^selectToDo)(NSInteger index);

@interface PopoverView : UIView

//-(id)initWithPoint:(CGPoint)point titles:(NSArray *)titles images:(NSArray *)images scroller:(BOOL)scroll;
//-(void)show;
//-(void)dismiss;
//-(void)dismiss:(BOOL)animated;

/**
 *  弹出框
 *
 *  @param point  弹出框尖角的坐标
 *  @param titles 展示的文字
 *  @param images 展示的图片(可为nil)
 *  @param scroll 是否滚动
 *  @param tt     弹出框内容点击事件(0~n)
 */
+ (void)popUpWithPoint:(CGPoint)point titles:(NSArray *)titles images:(NSArray *)images scroller:(BOOL)scroll selectTodo:(selectToDo)tt;

@property (nonatomic, copy) UIColor *borderColor;
@property (nonatomic, copy) void (^selectRowAtIndex)(NSInteger index);
@property (nonatomic, copy) selectToDo aa;

@end
