//
//  ShowView.m
//  mybuilding
//
//  Created by MZero on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ShowView.h"

@implementation ShowView

+(void)showAtFrame:(CGRect)frame backgroundColor:(UIColor *)bgColor title:(NSString *)titleStr titleColor:(UIColor *)titleColor titleFontOfSize:(CGFloat)fsize animateWithDuration:(NSTimeInterval)time completion:(void (^)())completion
{
    UILabel *sv = [[UILabel alloc]initWithFrame:frame];
    sv.backgroundColor = bgColor;
    sv.text = titleStr;
    sv.textColor = titleColor;
    sv.font = [UIFont systemFontOfSize:fsize];
    sv.textAlignment = NSTextAlignmentCenter;
    
    [[[UIApplication sharedApplication].windows lastObject] addSubview:sv];
    [UIView animateWithDuration:time animations:^{
        sv.alpha = 0.01;
    } completion:^(BOOL finished) {
        completion();
        [sv removeFromSuperview];
    }];
    
    
}

@end
