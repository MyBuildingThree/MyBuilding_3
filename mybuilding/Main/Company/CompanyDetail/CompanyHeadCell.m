//
//  CompanyHeadCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CompanyHeadCell.h"
#import "RKShadowView.h"

@implementation CompanyHeadCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headImageView];
        [self.contentView addSubview:self.companyName];
        [self.contentView addSubview:self.contactName];
        [self.contentView addSubview:self.emailLabel];
        [self.contentView addSubview:self.bottomView];
        [self.contentView addSubview:self.approveBtn];
    }
    return self;
}

-(void)setModel:(CompanyModel *)model{
    [self.headImageView sd_setImageWithURL:model.a_companyLogo placeholderImage:nil];
    self.companyName.text = model.a_companyName;
    self.contactName.text = [NSString stringWithFormat:@"联系人：%@",model.a_companyContactName];
    self.emailLabel.text = [NSString stringWithFormat:@"邮箱：%@",model.a_companyContactEmail];
}

-(UIImageView *)headImageView{
    if(!_headImageView){
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 85, 85)];
        _headImageView.backgroundColor = [UIColor greenColor];
        _headImageView.layer.masksToBounds = YES;
        _headImageView.layer.cornerRadius = 42.5;
    }
    return _headImageView;
}

-(UILabel *)companyName{
    if(!_companyName){
        _companyName = [[UILabel alloc] initWithFrame:CGRectMake(105, 13, kScreenWidth-120, 45)];
        _companyName.textAlignment = NSTextAlignmentLeft;
        _companyName.textColor = RGBCOLOR(51, 51, 51);
        _companyName.font = [UIFont boldSystemFontOfSize:17];
        _companyName.numberOfLines = 2;
    }
    return _companyName;
}

-(UILabel *)contactName{
    if(!_contactName){
        _contactName = [[UILabel alloc] initWithFrame:CGRectMake(105, 62, kScreenWidth-110, 20)];
        _contactName.font = [UIFont systemFontOfSize:15];
        _contactName.textColor = RGBCOLOR(127, 127, 127);
    }
    return _contactName;
}

-(UILabel *)emailLabel{
    if(!_emailLabel){
        _emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(105, 82.5, kScreenWidth-110, 20)];
        _emailLabel.font = [UIFont systemFontOfSize:15];
        _emailLabel.textColor = RGBCOLOR(127, 127, 127);
    }
    return _emailLabel;
}

-(UIView *)bottomView{
    if(!_bottomView){
        _bottomView = [RKShadowView seperatorLineWithHeight:10 top:0];
        _bottomView.center = CGPointMake(kScreenWidth/2, 116);
    }
    return _bottomView;
}

-(UIButton *)approveBtn{
    if(!_approveBtn){
        _approveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _approveBtn.frame = CGRectMake(0, 121, kScreenWidth, 55);
        _approveBtn.backgroundColor = RGBCOLOR(34, 192, 100);
        [_approveBtn setTitle:@"申请认证" forState:UIControlStateNormal];
        _approveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _approveBtn;
}
@end
