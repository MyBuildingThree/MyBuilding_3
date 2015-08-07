//
//  OtherCell.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "OtherCell.h"
#import "UIView+ViewKit.h"
#import "MyView.h"

@interface OtherCell()

@property (nonatomic, strong)MyView *v0;
@property (nonatomic, strong)MyView *v1;
@property (nonatomic, strong)MyView *v2;
@property (nonatomic, strong)MyView *v3;
@property (nonatomic, strong)MyView *v4;
@property (nonatomic, strong)MyView *v5;
@property (nonatomic, strong)MyView *v6;

@end


@implementation OtherCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.v0 = [[MyView alloc]init];
        self.v1 = [[MyView alloc]init];
        self.v2 = [[MyView alloc]init];
        self.v3 = [[MyView alloc]init];
        self.v4 = [[MyView alloc]init];
        self.v5 = [[MyView alloc]init];
        self.v6 = [[MyView alloc]init];
        [self addSubview:self.v0];
        [self addSubview:self.v1];
        [self addSubview:self.v2];
        [self addSubview:self.v3];
        [self addSubview:self.v4];
        [self addSubview:self.v5];
        [self addSubview:self.v6];
        
    }
    return self;
}

-(void)setOtherArray:(NSMutableArray *)otherArray
{
    self.v0.title = otherArray[0];
    self.v1.title = otherArray[1];
    self.v2.title = otherArray[2];
    self.v3.title = otherArray[3];
    self.v4.title = otherArray[4];
    self.v5.title = otherArray[5];
    self.v6.title = otherArray[6];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.v0.frame = CGRectMake(0, 0, kScreenWidth, 38);
    self.v1.frame = CGRectMake(0, 38, kScreenWidth, 38);
    self.v2.frame = CGRectMake(0, 38*2, kScreenWidth, 38);
    self.v3.frame = CGRectMake(0, 38*3, kScreenWidth, 38);
    self.v4.frame = CGRectMake(0, 38*4, kScreenWidth, 38);
    self.v5.frame = CGRectMake(0, 38*5, kScreenWidth, 38);
    self.v6.frame = CGRectMake(0, 38*6, kScreenWidth, 38);
    
}


@end
