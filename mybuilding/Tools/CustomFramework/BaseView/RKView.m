//
//  RKView.m
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/29.
//
//

#import "RKView.h"

@implementation RKView
- (void)willMoveToSuperview:(UIView *)newSuperview{
    if ([self.delegate respondsToSelector:@selector(willMoveToSuperview:)]) {
        [self.delegate willMoveToSuperview:newSuperview];
    }
}
@end
