//
//  CompanyTableViewCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CompanyTableViewCell.h"
#import "RKShadowView.h"
#import "UIView+ViewKit.h"

@implementation CompanyTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headImageBtn];
        [self.contentView addSubview:self.companyIndustry];
        [self.contentView addSubview:self.companyName];
        [self.contentView addSubview:self.companyDesc];
        [self.contentView addSubview:self.bottomView];
    }
    return self;
}

-(void)setModel:(CompanyModel *)model{
    [self.headImageBtn sd_setBackgroundImageWithURL:model.a_companyLogo forState:UIControlStateNormal placeholderImage:nil];
    self.companyIndustry.text = model.a_companyIndustry;
    self.companyName.text = model.a_companyName;
    self.companyDesc.text = model.a_companyDescription;
}

-(UIButton *)headImageBtn{
    if(!_headImageBtn){
        _headImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headImageBtn.frame = CGRectMake(10, 10, 80, 80);
        _headImageBtn.layer.masksToBounds = YES;
        _headImageBtn.layer.cornerRadius = 40;
    }
    return _headImageBtn;
}

-(UILabel *)companyIndustry{
    if(!_companyIndustry){
        _companyIndustry = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 210, 20)];
        _companyIndustry.textAlignment = NSTextAlignmentLeft;
        _companyIndustry.textColor = BlueColor;
        _companyIndustry.font = [UIFont systemFontOfSize:12];
    }
    return _companyIndustry;
}

-(UILabel *)companyName{
    if(!_companyName){
        _companyName = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 210, 20)];
        _companyName.textAlignment = NSTextAlignmentLeft;
        _companyName.font = [UIFont systemFontOfSize:16];
    }
    return _companyName;
}

-(UILabel *)companyDesc{
    if(!_companyDesc){
        _companyDesc = [[UILabel alloc] initWithFrame:CGRectMake(100, 50, 210, 40)];
        _companyDesc.numberOfLines = 2;
        _companyDesc.textAlignment = NSTextAlignmentLeft;
        _companyDesc.textColor = AllLightGrayColor;
        _companyDesc.font = [UIFont systemFontOfSize:14];
    }
    return _companyDesc;
}

-(UIView *)bottomView{
    if(!_bottomView){
        _bottomView = [RKShadowView seperatorLineWithHeight:10 top:0];
        [_bottomView setMinY:100];
    }
    return _bottomView;
}
@end
