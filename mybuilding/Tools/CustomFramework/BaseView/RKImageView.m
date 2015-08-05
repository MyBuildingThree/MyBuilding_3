//
//  RKImageView.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RKImageView.h"

@implementation RKImageView
- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    if ([self.delegate respondsToSelector:@selector(imageView:changeFrame:)]) {
        [self.delegate imageView:self changeFrame:self.frame];
    }
}

- (void)setImage:(UIImage *)image{
    [super setImage:image];
    if ([self.delegate respondsToSelector:@selector(imageView:changeImage:)]) {
        [self.delegate imageView:self changeImage:self.image];
    }
}
@end
