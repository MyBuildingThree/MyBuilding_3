//
//  RequirementsTableViewCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RequirementsTableViewCell.h"
#import "RKShadowView.h"
#import "UIView+ViewKit.h"
#import "RKViewFactory.h"
#import "UILabel+LabelKit.h"
#import "NSString+LabelKit.h"

@implementation RequirementsTableViewCell
+(CGFloat)carculateCellHeightWithModel:(RequirementsModel *)cellModel{
    CGFloat height = 0;
    CGRect size = [cellModel.a_reqDesc autosizeWithFont:[UIFont systemFontOfSize:16] maxWidth:kScreenWidth-26 maxHeight:90];
    height += size.size.height;
    height +=100;
    return height;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.headImageBtn];
        [self.contentView addSubview:self.userNameLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.reqTypeLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.bottomView];
    }
    return self;
}

-(void)setModel:(RequirementsModel *)model{
    [self.headImageBtn sd_setBackgroundImageWithURL:model.a_avatarUrl forState:UIControlStateNormal placeholderImage:nil];
    self.userNameLabel.text = model.a_loginName;
    self.contentLabel.text = model.a_reqDesc;
    self.reqTypeLabel.text = model.a_reqTypeCn;
    self.timeLabel.mainLabel.text = model.a_createdTime;
}

-(void)layoutSubviews{
    CGRect size = [self.contentLabel autosizeWithMaxWidth:kScreenWidth-26 maxHeight:90];
    CGFloat height = 0;
    height = size.origin.y + size.size.height;
    self.reqTypeLabel.frame = CGRectMake(10, height+14, 108, 20);
    [self.timeLabel setMaxX:kScreenWidth - 10 minY:height + 16];
    height += 20+16;
    [self.bottomView setMinY:height];
}

-(UIButton *)headImageBtn{
    if(!_headImageBtn){
        _headImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headImageBtn.frame = CGRectMake(10, 13, 40, 40);
        _headImageBtn.layer.masksToBounds = YES;
        _headImageBtn.layer.cornerRadius = 20;
    }
    return _headImageBtn;
}

-(UILabel *)userNameLabel{
    if(!_userNameLabel){
        _userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 25, kScreenWidth-60-10, 20)];
        _userNameLabel.font = [UIFont boldSystemFontOfSize:15];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _userNameLabel;
}

-(UILabel *)contentLabel{
    if(!_contentLabel){
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, 55, kScreenWidth-26, 0)];
        _contentLabel.font = [UIFont systemFontOfSize:16];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _contentLabel;
}

-(UILabel *)reqTypeLabel{
    if(!_reqTypeLabel){
        _reqTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 108, 20)];
        _reqTypeLabel.font = [UIFont systemFontOfSize:12];
        _reqTypeLabel.textColor = RGBCOLOR(148, 148, 153);
    }
    return _reqTypeLabel;
}

-(RKImageLabel *)timeLabel{
    if(!_timeLabel){
        _timeLabel = [RKImageLabel imageLabelWithHeight:13];
        _timeLabel.imageView.backgroundColor = [UIColor yellowColor];
        _timeLabel.imageView.size = CGSizeMake(13, 13);
        _timeLabel.mainLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.mainLabel.textColor = RGBCOLOR(148, 148, 153);
        _timeLabel.secondMargin = 3;
    }
    return _timeLabel;
}

-(UIView *)bottomView{
    if(!_bottomView){
        _bottomView = [RKShadowView seperatorLineWithHeight:10 top:0];
    }
    return _bottomView;
}
@end
