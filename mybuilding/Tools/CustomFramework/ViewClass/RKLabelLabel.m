//
//  RKLabelLabel.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RKLabelLabel.h"
#import "RKLabel.h"
#import "UIView+ViewKit.h"
#import "UILabel+LabelKit.h"

@interface RKLabelLabel ()<RKLabelDelegate>

@property(nonatomic, assign) RKLabelLabelDirection direction;

@end

@implementation RKLabelLabel
@synthesize firstLabel = _firstLabel;
@synthesize secondLabel = _secondLabel;

+ (instancetype)labelLabelWithHeight:(CGFloat)height{
    return [[self alloc] initWithHeight:height direction:RKLabelLabelDirectionRight];
}

//+ (instancetype)labelLabelWithHeight:(CGFloat)height direction:(RKLabelLabelDirection)direction{
//    return [[self alloc] initWithHeight:height direction:direction];
//}

- (instancetype)initWithHeight:(CGFloat)height direction:(RKLabelLabelDirection)direction{
    if (self = [super initWithFrame:CGRectMake(0, 0, 0, height)]) {
        self.direction = direction;
    }
    return self;
}

- (void)label:(RKLabel *)label changeText:(NSString *)text{
    [label autosize];
    [self refresh];
}

- (void)label:(RKLabel *)label changeFont:(UIFont *)font{
    [label autosize];
    [self refresh];
}

- (void)setFirstMargin:(CGFloat)firstMargin{
    _firstMargin = firstMargin;
    [self refresh];
}

//- (void)setSecondMargin:(CGFloat)secondMargin{
//    _secondMargin = secondMargin;
//    [self refresh];
//}

- (void)setThirdMargin:(CGFloat)thirdMargin{
    _thirdMargin = thirdMargin;
    [self refresh];
}

- (void)refresh{
    CGFloat firstMargin = self.firstMargin;
//    CGFloat secondMargin = self.secondMargin;
    CGFloat thirdMargin = self.thirdMargin;

    if (self.firstLabel.width > self.secondLabel.width) {
        self.secondLabel.width = self.firstLabel.width;
    }else if (self.firstLabel.width < self.secondLabel.width) {
        self.firstLabel.width = self.secondLabel.width;
    }
    self.width = MAX(self.firstLabel.width, self.secondLabel.width);
    
    [self.firstLabel setMinY:firstMargin];
    [self.secondLabel setMaxY:self.height - thirdMargin];
}

- (UILabel *)firstLabel{
    if (!_firstLabel) {
        RKLabel* firstLabel = [[RKLabel alloc] init];
        firstLabel.delegate = self;
        [self addSubview:firstLabel];
        
        _firstLabel = firstLabel;
    }
    return _firstLabel;
}

- (UILabel *)secondLabel{
    if (!_secondLabel) {
        RKLabel* secondLabel = [[RKLabel alloc] init];
        secondLabel.delegate = self;
        [self addSubview:secondLabel];
        
        _secondLabel = secondLabel;
    }
    return _secondLabel;
}
@end
