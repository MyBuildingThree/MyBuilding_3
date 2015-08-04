//
//  UIImageView+ViewKit.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "UIImageView+ViewKit.h"
#import "UIView+ViewKit.h"

@implementation UIImageView (ViewKit)
- (void)setCornerRadius:(CGFloat)cornerRadius{
    if (!self.layer.masksToBounds) {
        self.layer.masksToBounds = YES;
    }
    
    self.layer.cornerRadius = cornerRadius;
}

- (void)setIsRound:(BOOL)isRound{
    if (isRound) {
        if (!self.layer.masksToBounds) {
            self.layer.masksToBounds = YES;
        }
        [self setCornerRadius:self.halfWidth];
    }else{
        [self setCornerRadius:0];
    }
}
@end
