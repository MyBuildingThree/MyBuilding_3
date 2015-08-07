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

@property(nonatomic, assign) RKImageLabelDirection direction;

/**
 *  创建时的高度，只要未设置过canClickedSize，则 originHeight == self.height
 */
@property(nonatomic, assign) CGFloat originHeight;

@end

@implementation RKImageLabel
@synthesize imageView = _imageView;
@synthesize mainLabel = _mainLabel;

+ (instancetype)imageLabelWithHeight:(CGFloat)height{
    return [[self alloc] initWithHeight:height direction:RKImageLabelDirectionRight];
}

+ (instancetype)imageLabelWithHeight:(CGFloat)height direction:(RKImageLabelDirection)direction{
    return [[self alloc] initWithHeight:height direction:direction];
}

- (instancetype)initWithHeight:(CGFloat)height direction:(RKImageLabelDirection)direction{
    if (self = [super initWithFrame:CGRectMake(0, 0, 0, height)]) {
        self.direction = direction;
        self.originHeight = height;
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageLabelClicked)];
        [self addGestureRecognizer:tap];
    }
    return self;
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

- (void)setFirstMargin:(CGFloat)firstMargin{
    _firstMargin = firstMargin;
    [self refresh];
}

- (void)setSecondMargin:(CGFloat)secondMargin{
    _secondMargin = secondMargin;
    [self refresh];
}

- (void)setThirdMargin:(CGFloat)thirdMargin{
    _thirdMargin = thirdMargin;
    [self refresh];
}

- (void)setCanClickedSize:(CGSize)canClickedSize{
    if (self.direction == RKImageLabelDirectionRight) return;
    _canClickedSize = canClickedSize;
    
    self.size = canClickedSize;
    [self refresh];
}

- (void)refresh{
    CGFloat firstMargin = self.firstMargin;
    CGFloat secondMargin = self.secondMargin;
    CGFloat thirdMargin = self.thirdMargin;
    
    //向右排列
    if (self.direction == RKImageLabelDirectionRight) {
        [self.imageView setMinX:firstMargin midY:self.halfHeight];
        [self.mainLabel setMinX:self.imageView.maxX + secondMargin midY:self.halfHeight];
        self.width = self.mainLabel.maxX + thirdMargin;
        
    //向下排列
    }else if (self.direction == RKImageLabelDirectionBottom) {

        CGFloat midX;
        if (CGSizeEqualToSize(self.canClickedSize, CGSizeZero)) {
            CGFloat halfWidth = MAX(self.imageView.halfWidth, self.mainLabel.halfWidth);
            midX = halfWidth;
            self.width = halfWidth * 2;
        }else{
            CGFloat extraMargin = (self.height - self.originHeight) * 0.5 ;
            firstMargin += extraMargin;
            thirdMargin += extraMargin;
            midX = self.width * 0.5;
        }

        [self.imageView setMidX:midX minY:firstMargin];
        [self.mainLabel setMidX:midX maxY:self.height - thirdMargin];
    }
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

- (void)imageLabelClicked{
    if ([self.delegate respondsToSelector:@selector(imageLabelClicked:)]) {
        [self.delegate imageLabelClicked:self];
    }
}

- (CGRect)setHeight:(CGFloat)height{
    CGRect frame = [super setHeight:height];;
    [self refresh];
    return frame;
}
@end
