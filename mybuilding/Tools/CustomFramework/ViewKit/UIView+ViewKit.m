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

- (CGRect)setMinX:(CGFloat)minX{
    CGRect frame = self.frame;
    frame.origin.x = minX;
    self.frame = frame;
    
    return frame;
}

- (CGRect)setMinY:(CGFloat)minY{
    CGRect frame = self.frame;
    frame.origin.y = minY;
    self.frame = frame;
    
    return frame;
}

- (CGRect)setMidX:(CGFloat)midX{
    CGPoint center = self.center;
    center.x = midX;
    self.center = center;
    
    return self.frame;
}

- (CGRect)setMidY:(CGFloat)midY{
    CGPoint center = self.center;
    center.y = midY;
    self.center = center;
    
    return self.frame;
}



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
