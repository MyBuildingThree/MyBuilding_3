//
//  RKScrollViewPageController.m
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/29.
//
//

#import "RKScrollViewPageController.h"
#import "UIView+ViewKit.h"
#import "RKController.h"

@interface RKScrollViewPageController ()<UIScrollViewDelegate>
@property(nonatomic, strong) NSMutableArray* controllers;
@end
#define kScreenBounds [[UIScreen mainScreen] bounds]

@implementation RKScrollViewPageController

- (instancetype)initWithControllers:(NSMutableArray *)controllers{
    if (self = [super init]) {
        self.controllers = controllers;
        [self setUpViews];
    }
    return self;
}

/**
 *  设置各page上的view
 */
- (void)setUpViews{
    [self.controllers enumerateObjectsUsingBlock:^(RKController* controller, NSUInteger idx, BOOL *stop) {
        UIView* view = controller.view;
        [view setMinX:idx*kScreenWidth];
        
        [self.scrollView addSubview:view];
    }];
}

- (void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    
    CGFloat width = self.scrollView.width;
    CGPoint targetPoint = CGPointMake(width*currentIndex, 0);
    [self.scrollView setContentOffset:targetPoint animated:YES];
}

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
        scrollView.backgroundColor = [[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:.5];
        scrollView.pagingEnabled = YES;
        scrollView.clipsToBounds = YES;
        scrollView.directionalLockEnabled = YES;
        scrollView.delegate = self;
        
        NSInteger const count = self.controllers.count;
        scrollView.contentSize = CGSizeMake(kScreenWidth*count, 300);
        
        _scrollView = scrollView;
    }
    return _scrollView;
}

/**
 * 判断是否变化currentIndex
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat const width = self.scrollView.width;
    CGFloat const contentOffsetX = self.scrollView.contentOffset.x;
    
    if ([self.delegate respondsToSelector:@selector(scrollViewPageController:scrolledWithIndexPercent:)]) {
        CGFloat indexPercent = contentOffsetX/width;
        [self.delegate scrollViewPageController:self scrolledWithIndexPercent:indexPercent];
    }
    
    CGFloat const contentOffsetForCurrentIndex = self.currentIndex*width;
    CGFloat const differenceX = contentOffsetX-contentOffsetForCurrentIndex;
    if (ABS(differenceX) < width) return;
    
    NSInteger rightIndex = contentOffsetX/width;
    
    if (_currentIndex < rightIndex) {
        _currentIndex ++;
    }else if (_currentIndex > rightIndex) {
        _currentIndex --;
    }
    
    if ([self.delegate respondsToSelector:@selector(scrollViewPageController:changeIndex:)]) {
        [self.delegate scrollViewPageController:self changeIndex:self.currentIndex];
    }
}
@end
