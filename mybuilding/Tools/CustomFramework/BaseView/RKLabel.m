//
//  RKLabel.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RKLabel.h"

@implementation RKLabel
- (void)setText:(NSString *)text{
    [super setText:text];
    if ([self.delegate respondsToSelector:@selector(label:changeText:)]) {
        [self.delegate label:self changeText:self.text];
    }
}

- (void)setFont:(UIFont *)font{
    [super setFont:font];
    if ([self.delegate respondsToSelector:@selector(label:changeFont:)]) {
        [self.delegate label:self changeFont:self.font];
    }
}
@end
