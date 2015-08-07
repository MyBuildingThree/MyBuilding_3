//
//  CompanyOtherCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CompanyOtherCell.h"
#import "RKShadowView.h"
#import "UIView+ViewKit.h"

@implementation CompanyOtherCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.countLabel];
        [self.contentView addSubview:self.arrowImageView];
        [self.contentView addSubview:self.cutLine];
    }
    return self;
}

-(UILabel *)titleLabel{
    if(!_titleLabel){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 14, 100, 20)];
        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.textColor = RGBCOLOR(51, 51, 51);
    }
    return _titleLabel;
}

-(UILabel *)countLabel{
    if(!_countLabel){
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-120-37, 15, 120, 20)];
        _countLabel.textColor = RGBCOLOR(155, 155, 155);
        _countLabel.font = [UIFont systemFontOfSize:15];
        _countLabel.textAlignment = NSTextAlignmentRight;
    }
    return _countLabel;
}

-(UIImageView *)arrowImageView{
    if(!_arrowImageView){
        _arrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth-18, 16, 8, 13.5)];
        _arrowImageView.backgroundColor = [UIColor greenColor];
    }
    return _arrowImageView;
}

-(UIView *)cutLine{
    if(!_cutLine){
        _cutLine = [RKShadowView seperatorLine];
        [_cutLine setMinY:45];
    }
    return _cutLine;
}
@end
