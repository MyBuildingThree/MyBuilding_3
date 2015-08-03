//
//  RKScrollViewControl.m
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/30.
//
//

#import "RKScrollViewControl.h"

@implementation RKScrollViewControl
- (void)setUp11 {
    //    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 200, kScreenWidth, 300)];
    //    _scrollView.contentSize = CGSizeMake(kScreenWidth*5, 300);
    //    //        scrollView.pagingEnabled = YES;
    //    //        scrollView.clipsToBounds = YES;
    //    //        scrollView.showsHorizontalScrollIndicator = NO;
    //    //        scrollView.delegate = self;
    //    [_scrollView setDelegate:self];
    self.scrollView11 = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.scrollView11.contentSize = CGSizeMake(kScreenWidth*2, 300);
    
    //        scrollView.pagingEnabled = YES;
    //        scrollView.clipsToBounds = YES;
    //        scrollView.showsHorizontalScrollIndicator = NO;
    //        scrollView.delegate = self;
    [self.scrollView11 setDelegate:self];
    self.scrollView11.backgroundColor = [[UIColor alloc] initWithRed:.5 green:.5 blue:.5 alpha:.5];
}

@end
