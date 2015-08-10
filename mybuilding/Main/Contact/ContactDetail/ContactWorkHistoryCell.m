//
//  ContactWorkHistoryCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ContactWorkHistoryCell.h"
#import "RKShadowView.h"
#import "UIView+ViewKit.h"
#import "UILabel+LabelKit.h"
#import "NSString+LabelKit.h"

@implementation ContactWorkHistoryCell
+(CGFloat)carculateCellHeightWithString:(NSString *)str{
    CGFloat height = 0;
    CGRect size = [str autosizeWithFont:[UIFont systemFontOfSize:16] maxWidth:kScreenWidth-20];
    height += size.size.height+60;
    return height;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.companyNameLabel];
        [self.contentView addSubview:self.workDescLabel];
        [self.contentView addSubview:self.bottomView];
    }
    return self;
}

-(void)setModel:(PersonModel *)model{
    
}

-(void)layoutSubviews{
    
}

-(UILabel *)timeLabel{
    if(!_timeLabel){
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        _timeLabel.font = [UIFont systemFontOfSize:15];
    }
    return _timeLabel;
}

-(UILabel *)companyNameLabel{
    if(!_companyNameLabel){
    
    }
    return _companyNameLabel;
}

-(UILabel *)workDescLabel{
    if(!_workDescLabel){
    
    }
    return _workDescLabel;
}

-(UIView *)bottomView{
    if(!_bottomView){
        _bottomView = [RKShadowView seperatorLineWithHeight:10 top:0];
    }
    return _bottomView;
}
@end
