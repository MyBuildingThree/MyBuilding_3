//
//  RKImageLabel.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RKImageLabel.h"
#import "RKImageView.h"
#import "RKLabel.h"
#import "UIView+ViewKit.h"
#import "UILabel+LabelKit.h"

@interface RKImageLabel ()<RKImageViewDelegate,RKLabelDelegate>

@end

@implementation RKImageLabel
@synthesize imageView = _imageView;
@synthesize mainLabel = _mainLabel;

+ (instancetype)imageLabelWithHeight:(CGFloat)height{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, 0, height)];
}

- (void)imageView:(RKImageView *)imageView changeFrame:(CGRect)frame{
    [self refresh];
}

- (void)imageView:(RKImageView *)imageView changeImage:(UIImage *)image{
    [self refresh];
}

- (void)label:(RKLabel *)label changeText:(NSString *)text{
    [self.mainLabel autosize];
    [self refresh];
}

- (void)label:(RKLabel *)label changeFont:(UIFont *)font{
    [self.mainLabel autosize];
    [self refresh];
}

- (void)setLeftMargin:(CGFloat)leftMargin{
    _leftMargin = leftMargin;
    [self refresh];
}

- (void)setCenterMargin:(CGFloat)centerMargin{
    _centerMargin = centerMargin;
    [self refresh];
}

- (void)setRightMargin:(CGFloat)rightMargin{
    _rightMargin = rightMargin;
    [self refresh];
}

- (void)refresh{
    [self.imageView setMinX:self.leftMargin midY:self.halfHeight];
    [self.mainLabel setMinX:self.imageView.maxX + self.centerMargin midY:self.halfHeight];
    self.width = self.mainLabel.maxX + self.rightMargin;
    NSLog(@"mainLabelFrame = %@",NSStringFromCGRect(self.mainLabel.frame));
}

- (UILabel *)mainLabel{
    if (!_mainLabel) {
        RKLabel* mainLabel = [[RKLabel alloc] init];
        mainLabel.delegate = self;
        [self addSubview:mainLabel];
        
        _mainLabel = mainLabel;
    }
    return _mainLabel;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        RKImageView* imageView = [[RKImageView alloc] init];
        imageView.delegate = self;
        [self addSubview:imageView];
        
        _imageView = imageView;
    }
    return _imageView;
}
@end
