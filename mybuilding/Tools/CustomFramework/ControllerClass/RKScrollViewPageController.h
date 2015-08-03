//
//  RKScrollViewPageController.h
//  ZhuZhan
//
//  Created by 孙元侃 on 15/7/29.
//
//

#import <Foundation/Foundation.h>

@class RKScrollViewPageController;
@protocol RKScrollViewPageControllerDelegate <NSObject>

@optional

/**
 *  currentIndex变化时的委托
 */
- (void)scrollViewPageController:(RKScrollViewPageController*)controller changeIndex:(NSInteger)currentIndex;

/**
 *  scrollView滚动时的代理
 *  @param percent    用于判断当前滑动到的位置占全部能滑动到的位置的比例，值域正常情况下为0-1，划出scrollView的contentSzie左右两边的时候会超出值域一小段部分
 */
- (void)scrollViewPageController:(RKScrollViewPageController*)controller scrolledWithIndexPercent:(CGFloat)indexPercent;

@end

@interface RKScrollViewPageController : NSObject

- (instancetype)initWithControllers:(NSMutableArray*)/*RKController*/controllers;

@property(nonatomic, strong)UIScrollView* scrollView;

/**
 *  get:获取当前page的currentIndex
 *  set:设置currentIndex同时会将页面切换至对应的视图位置
 */
@property(nonatomic) NSInteger currentIndex;

@property(nonatomic, weak) id<RKScrollViewPageControllerDelegate> delegate;
@end
