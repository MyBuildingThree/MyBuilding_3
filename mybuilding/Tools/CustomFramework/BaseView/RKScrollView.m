//
//  RKScrollView.m
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/29.
//
//

#import "RKScrollView.h"

@implementation RKScrollView
//@dynamic delegate;
//@synthesize contentOffset = _contentOffset;

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if ([self.delegate respondsToSelector:@selector(willMoveToSuperview:)]) {
        [self.delegate willMoveToSuperview:newSuperview];
    }
}

- (void)setContentOffset:(CGPoint)contentOffset{
    [super setContentOffset:contentOffset];
}
@end
