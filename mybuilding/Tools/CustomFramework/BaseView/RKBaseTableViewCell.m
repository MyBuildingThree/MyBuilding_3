//
//  RKBaseTableViewCell.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RKBaseTableViewCell.h"
#import "RKImageLabel.h"

@implementation RKBaseTableViewCell
@synthesize bottomView = _bottomView;

+ (CGFloat)carculateHeightWithModel:(id)model{
    return 44;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (UIImageView *)mainImageView{
    if (!_mainImageView) {
        _mainImageView = [[UIImageView alloc] init];
        [self addSubview:_mainImageView];
    }
    return _mainImageView;
}

- (UILabel *)mainLabel{
    if (!_mainLabel) {
        _mainLabel = [[UILabel alloc] init];
        [self addSubview:_mainLabel];
    }
    return _mainLabel;
}

- (UILabel *)subLabel_1{
    if (!_subLabel_1) {
        _subLabel_1 = [[UILabel alloc] init];
        [self addSubview:_subLabel_1];
    }
    return _subLabel_1;
}

- (UILabel *)subLabel_2{
    if (!_subLabel_2) {
        _subLabel_2 = [[UILabel alloc] init];
        [self addSubview:_subLabel_2];
    }
    return _subLabel_2;
}

- (UIButton *)assistBtn{
    if (!_assistBtn) {
        _assistBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_assistBtn addTarget:self action:@selector(assistBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_assistBtn];
    }
    return _assistBtn;
}

- (RKImageLabel *)imageLabel_1{
    if (!_imageLabel_1) {
        _imageLabel_1 = [RKImageLabel imageLabelWithHeight:0];
        _imageLabel_1.imageView.frame = CGRectMake(0, 0, 12, 12);
        _imageLabel_1.mainLabel.text = @"时间";
        _imageLabel_1.secondMargin = 4;
        _imageLabel_1.mainLabel.textColor = RGBCOLOR(148, 148, 153);
        _imageLabel_1.mainLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_imageLabel_1];
    }
    return _imageLabel_1;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
    }
    return _bottomView;
}

- (void)setBottomView:(UIView *)bottomView{
    _bottomView = bottomView;
    
    if (!bottomView.superview) {
        [self addSubview:bottomView];
    }
}

- (void)assistBtnClicked{
    if ([self.delegate respondsToSelector:@selector(tableViewCellAssistBtnClicked)]) {
        [self.delegate tableViewCellAssistBtnClicked];
    }
}
@end
