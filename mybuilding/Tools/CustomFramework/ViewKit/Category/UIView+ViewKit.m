//
//  UIView+ViewKit.m
//  RKKit
//
//  Created by 孙元侃 on 15/7/29.
//  Copyright (c) 2015年 孙元侃. All rights reserved.
//

#import "UIView+ViewKit.h"

@implementation UIView (ViewKit)

- (CGFloat)minX{
    return CGRectGetMinX(self.frame);
}

- (CGFloat)midX{
    return CGRectGetMidX(self.frame);
}

- (CGFloat)maxX{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)minY{
    return CGRectGetMinY(self.frame);
}

- (CGFloat)midY{
    return CGRectGetMidY(self.frame);
}

- (CGFloat)maxY{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)width{
    return CGRectGetWidth(self.frame);
}

- (CGFloat)height{
    return CGRectGetHeight(self.frame);
}

- (CGFloat)halfWidth{
    return CGRectGetWidth(self.frame)*0.5;
}

- (CGFloat)halfHeight{
    return CGRectGetHeight(self.frame)*0.5;
}

- (CGPoint)internalCenter{
    return CGPointMake(self.halfWidth, self.halfHeight);
}

- (CGSize)size{
    return self.frame.size;
}

- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGPoint)origin{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

#pragma 分割线
- (CGRect)setMinX:(CGFloat)minX{
    CGRect frame = self.frame;
    frame.origin.x = minX;
    self.frame = frame;
    
    return frame;
}

- (CGRect)setMidX:(CGFloat)midX{
    CGPoint center = self.center;
    center.x = midX;
    self.center = center;
    
    return self.frame;
}

- (CGRect)setMinY:(CGFloat)minY{
    CGRect frame = self.frame;
    frame.origin.y = minY;
    self.frame = frame;
    
    return frame;
}


- (CGRect)setMidY:(CGFloat)midY{
    CGPoint center = self.center;
    center.y = midY;
    self.center = center;
    
    return self.frame;
}

- (CGRect)setMaxY:(CGFloat)maxY{
    CGRect frame = self.frame;
    frame.origin.y = maxY - self.height;
    self.frame = frame;
    
    return self.frame;
}

- (CGRect)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    
    return frame;
}

- (CGRect)setMinX:(CGFloat)minX midY:(CGFloat)midY{
    CGPoint center = CGPointMake(minX + self.halfWidth, midY);
    self.center = center;
    
    return self.frame;
}

- (CGRect)setMidX:(CGFloat)midX minY:(CGFloat)minY{
    CGPoint center = CGPointMake(midX, minY + self.halfHeight);
    self.center = center;
    
    return self.frame;
}

- (CGRect)setMidX:(CGFloat)midX maxY:(CGFloat)maxY{
    CGPoint center = CGPointMake(midX, maxY - self.halfHeight);
    self.center = center;
    
    return self.frame;
}

#pragma 分割线
+ (void)horizontalArrangeViews:(NSArray*)/*UIView*/views distances:(NSArray*)/*NSString*/distances alignmentType:(RKViewArrangeAlignment)alignment direction:(RKViewArrangeDirection)direction{
    __block UIView* lastView;
    [views enumerateObjectsUsingBlock:^(UIView* view, NSUInteger idx, BOOL *stop) {
        CGFloat distance = [distances[idx] doubleValue];
        (direction == RKViewArrangeDirectionRight) ? [view setMinX:(lastView.maxX + distance)] : [view setMinY:(lastView.maxY + distance)];
        
        switch (alignment) {
            case RKViewArrangeAlignmentMid:
                if (idx == 0) break;
                (direction == RKViewArrangeDirectionRight) ? [view setMidY:lastView.midY] : [view setMidX:lastView.midX];
                break;
                
            default:
                break;
        }
        
        lastView = view;
    }];
}
@end
