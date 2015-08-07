//
//  CompanyContentCell.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/7.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CompanyContentCell.h"
#import "UIView+ViewKit.h"
#import "UILabel+LabelKit.h"
#import "NSString+LabelKit.h"
#import "RKShadowView.h"

@implementation CompanyContentCell

+(CGFloat)carculateCellHeightWithString:(NSString *)str{
    CGFloat height = 0;
    CGRect size = [str autosizeWithFont:[UIFont systemFontOfSize:16] maxWidth:kScreenWidth-20];
    height += size.size.height+15;
    return height;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.cutLine];
    }
    return self;
}

-(void)setContent:(NSString *)content{
    self.contentLabel.text = content;
}

-(void)layoutSubviews{
    CGRect size = [self.contentLabel autosizeWithMaxWidth:kScreenWidth-20];
    NSLog(@"==>%f",size.size.height);
    [self.cutLine setMinY:size.size.height+13];
}

-(UILabel *)contentLabel{
    if(!_contentLabel){
        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 6, kScreenWidth-20, 0)];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.textColor = RGBCOLOR(68, 74, 89);
    }
    return _contentLabel;
}

-(UIView *)cutLine{
    if(!_cutLine){
        _cutLine = [RKShadowView seperatorLine];
    }
    return _cutLine;
}
@end
