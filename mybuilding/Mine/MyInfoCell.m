//
//  MyInfoCell.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MyInfoCell.h"
#import "UIView+ViewKit.h"
#import "RKShadowView.h"

@interface MyInfoCell ()
/**
 *  头像
 */
@property (nonatomic,strong)UIImageView *userImage;
/**
 *  用户名
 */
@property (nonatomic,strong)UILabel *userNameLabel;
/**
 *  公司名
 */
@property (nonatomic,strong)UILabel *companyLabel;
/**
 *  项目外包经理
 */
@property (nonatomic,strong)UILabel *managerLabel;
/**
 *  分隔
 */
@property (nonatomic,strong)UIView *shadowView;

@end

@implementation MyInfoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        //头像
        self.userImage = [[UIImageView alloc]init];
        self.userImage.layer.masksToBounds = YES;
        self.userImage.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.userImage];
        //用户名
        self.userNameLabel = [[UILabel alloc]init];
        self.userNameLabel.textAlignment = NSTextAlignmentLeft;
        self.userNameLabel.font = [UIFont boldSystemFontOfSize:17.f];
        [self addSubview:self.userNameLabel];
        //公司名
        self.companyLabel = [[UILabel alloc]init];
        self.companyLabel.textAlignment = NSTextAlignmentLeft;
        self.companyLabel.font = [UIFont systemFontOfSize:15.f];
        [self addSubview:self.companyLabel];
        //经理
        self.managerLabel = [[UILabel alloc]init];
        self.managerLabel.textAlignment = NSTextAlignmentLeft;
        self.managerLabel.font = [UIFont systemFontOfSize:15.f];
        [self addSubview:self.managerLabel];
        
        //
        self.shadowView = [RKShadowView seperatorLineWithHeight:10 top:0];
        [self addSubview:self.shadowView];
    }
    return self;
}

-(void)setPersonModel:(PersonModel *)personModel
{
    [self.userImage sd_setImageWithURL:personModel.a_avatarUrl placeholderImage:nil];
    self.userNameLabel.text = personModel.a_name;
    self.companyLabel.text = personModel.a_companyName;
    self.managerLabel.text = personModel.a_duties;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.userImage.frame = CGRectMake(10.f, 13.f, 70.f, 70.f);
    self.userImage.layer.cornerRadius = self.userImage.width*0.5;
    self.userNameLabel.frame = CGRectMake(90.f, 13.f, 67.f, 17.f);
    self.companyLabel.frame = CGRectMake(90.f, 34.f, 184.f, 16.f);
    self.managerLabel.frame = CGRectMake(90.f, 54.f, 209.f, 16.f);
    self.shadowView.origin = CGPointMake(0, 96.f);
}

@end
