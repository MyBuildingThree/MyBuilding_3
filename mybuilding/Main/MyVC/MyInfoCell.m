//
//  MyInfoCell.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MyInfoCell.h"

@interface MyInfoCell ()
/**
 *  头像
 */
@property (nonatomic,strong)UIImageView *userImage;
/**
 *  用户名
 */
@property (nonatomic,copy)NSString *userName;
/**
 *  公司名
 */
@property (nonatomic,copy)NSString *company;
/**
 *  项目外包经理
 */
@property (nonatomic,copy)NSString *manager;

@end

@implementation MyInfoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.userImage = [[UIImageView alloc]init];
        self.userImage.layer.masksToBounds = YES;
    }
    return self;
}

@end
