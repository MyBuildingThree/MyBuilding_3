//
//  ContactHeadCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ContactHeadCell.h"

@implementation ContactHeadCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headImageView];
        [self.contentView addSubview:self.userNameLabel];
        [self.contentView addSubview:self.companyNameLabel];
        [self.contentView addSubview:self.dutiesLabel];
        [self.contentView addSubview:self.addressLabel];
        [self.contentView addSubview:self.bottomView];
    }
    return self;
}

-(void)setModel:(PersonModel *)model{
    [self.headImageView sd_setImageWithURL:model.a_avatarUrl placeholderImage:nil];
    self.userNameLabel.text = model.a_name;
    self.companyNameLabel.text = model.a_companyName;
    self.dutiesLabel.text = model.a_duties;
    if([model.a_province isEqualToString:@""] && [model.a_city isEqualToString:@""]){
        self.addressLabel.text = @"";
    }else{
        self.addressLabel.text = [NSString stringWithFormat:@"%@,%@",model.a_province,model.a_city];
    }
}

-(UIImageView *)headImageView{
    if(!_headImageView){
        _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 13, 70, 70)];
        _headImageView.backgroundColor = [UIColor greenColor];
        _headImageView.layer.masksToBounds = YES;
        _headImageView.layer.cornerRadius = 35;
    }
    return _headImageView;
}

-(UILabel *)userNameLabel{
    if(!_userNameLabel){
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 13, kScreenWidth-100, 20)];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
        _userNameLabel.textColor = RGBCOLOR(23, 22, 22);
        _userNameLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    return _userNameLabel;
}

-(UILabel *)companyNameLabel{
    if(!_companyNameLabel){
        _companyNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 35, kScreenWidth-100, 20)];
        _companyNameLabel.textAlignment = NSTextAlignmentLeft;
        _companyNameLabel.textColor = RGBCOLOR(119, 119, 119);
        _companyNameLabel.font = [UIFont systemFontOfSize:15];
    }
    return _companyNameLabel;
}

-(UILabel *)dutiesLabel{
    if(!_dutiesLabel){
        _dutiesLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 50, kScreenWidth-100, 20)];
        _dutiesLabel.textAlignment = NSTextAlignmentLeft;
        _dutiesLabel.textColor = RGBCOLOR(119, 119, 119);
        _dutiesLabel.font = [UIFont systemFontOfSize:15];
    }
    return _dutiesLabel;
}

-(UILabel *)addressLabel{
    if(!_addressLabel){
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 70, kScreenWidth-100, 20)];
        _addressLabel.textAlignment = NSTextAlignmentLeft;
        _addressLabel.textColor = RGBCOLOR(119, 119, 119);
        _addressLabel.font = [UIFont systemFontOfSize:15];
    }
    return _addressLabel;
}
@end
