//
//  MyView.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MyView.h"

@implementation MyView

-(void)setTitle:(NSString *)title
{
    _title = title;
    [self addSubviewsWithTitle:title];
}

- (void)addSubviewsWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10.f, 10.f, kScreenWidth*0.7, 18.f)];
    label.text = title;
    label.textAlignment = NSTextAlignmentLeft;
    [self addSubview:label];
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth-10-8, 12.f, 8, 14.f)];
    imageV.backgroundColor = [UIColor blueColor];
    [self addSubview:imageV];
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-1, kScreenWidth, 1.f)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
}


@end
