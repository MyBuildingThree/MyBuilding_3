//
//  UILabel+LabelKit.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "UILabel+LabelKit.h"
#import "NSString+LabelKit.h"
#import "UIView+ViewKit.h"
@implementation UILabel (LabelKit)
- (CGRect)autosize{
    CGRect bounds = [self.text autosizeWithFont:self.font];
    self.size = bounds.size;
    
    return self.frame;
}

- (CGRect)autosizeWithMaxWidth:(CGFloat)maxWidth{
    if (maxWidth == 0) return [self autosize];
    
    CGRect bounds = [self.text autosizeWithFont:self.font maxWidth:maxWidth];
    self.size = bounds.size;
    self.numberOfLines = 0;
    
    return self.frame;
}

- (CGRect)autosizeWithMaxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight{
    if (maxHeight == 0) return [self autosizeWithMaxWidth:maxWidth];
    
    CGRect bounds = [self.text autosizeWithFont:self.font maxWidth:maxWidth maxHeight:maxHeight];
    self.size = bounds.size;
    self.numberOfLines = 0;
    
    return self.frame;
}
@end
