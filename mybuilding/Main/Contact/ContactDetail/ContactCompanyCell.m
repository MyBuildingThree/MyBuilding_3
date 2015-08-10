//
//  ContactCompanyCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ContactCompanyCell.h"
#import "RKShadowView.h"
#import "UIView+ViewKit.h"

@implementation ContactCompanyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headImageView];
        [self.contentView addSubview:self.companyNameLabel];
        [self.contentView addSubview:self.industryLabel];
        [self.contentView addSubview:self.bottomView];
    }
    return self;
}

-(void)setModel:(PersonModel *)model{
    self.companyNameLabel.text = model.a_approveCompanyName;
    self.industryLabel.text = model.a_industry;
}

-(UIImageView *)headImageView{
    if(!_headImageView){
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _headImageView.backgroundColor = [UIColor greenColor];
        _headImageView.layer.masksToBounds = YES;
        _headImageView.layer.cornerRadius = 25;
    }
    return _headImageView;
}

-(UILabel *)companyNameLabel{
    if(!_companyNameLabel){
        _companyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 18, kScreenWidth-80, 20)];
        _companyNameLabel.textAlignment = NSTextAlignmentLeft;
        _companyNameLabel.textColor = RGBCOLOR(51, 51, 51);
        _companyNameLabel.font = [UIFont systemFontOfSize:17];
    }
    return _companyNameLabel;
}

-(UILabel *)industryLabel{
    if(!_industryLabel){
        _industryLabel = [[UILabel alloc] initWithFrame:CGRectMake(70, 40, kScreenWidth-80, 20)];
        _industryLabel.textAlignment = NSTextAlignmentLeft;
        _industryLabel.font = [UIFont systemFontOfSize:12];
        _industryLabel.textColor = RGBCOLOR(22, 119, 203);
    }
    return _industryLabel;
}

-(UIView *)bottomView{
    if(!_bottomView){
        _bottomView = [RKShadowView seperatorLine];
        [_bottomView setMinY:69];
    }
    return _bottomView;
}
@end
