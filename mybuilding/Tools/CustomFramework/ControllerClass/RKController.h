//
//  RKController.h
//  ZhuZhan
//
//  Created by 孙元侃 on 15/5/22.
//
//

#import <Foundation/Foundation.h>
#import "RKBaseTableView.h"

typedef enum {
    RKControllerRefreshHeader,
    RKControllerRefreshFooter,
    RKControllerRefreshFirstLoad = RKControllerRefreshHeader
}RKControllerRefreshType;

@protocol RKControllerDelegate <NSObject,UITableViewDelegate>
@optional
- (void)controllerStartLoading;
- (void)controllerEndLoading;
@end

/**
 *  控制器，含视图
 */
@interface RKController : NSObject<RKBaseTableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UIActivityIndicatorView* indicatorView;

- (instancetype)initWithNavi:(UINavigationController*)navi;
/**
 *  对于controller而言可用的navi，应从初始化方法中从UIViewController赋值过去
 */
@property(nonatomic,strong,readonly)UINavigationController* navigationController;

/**
 *  放model数据的数组
 */
@property(nonatomic,strong)NSMutableArray* models;

/**
 *  分页
 */
@property(nonatomic)NSInteger startIndex;

@property(nonatomic,strong)UIView* view;
//- (void)setViewFrame:(CGRect)frame;

@property(nonatomic,strong)RKBaseTableView* tableView;
@property(nonatomic,strong)UIView* tableViewNoDataView;

/**
 *  设置，所有init之后会自动调用
 */
- (void)setUp;

@property(nonatomic,weak)id<RKControllerDelegate> delegate;
- (void)startLoading;
- (void)endLoading;

/**
 *  开启键盘通知
 */
-(void)addKeybordNotification;

/**
 *  键盘通知开启后的回调方法
 *
 *  @param noti 通知
 */
-(void)keybordWillChangeFrame:(NSNotification *)noti;

/**
 *  设置下拉和上拉刷新
 */
- (void)setUpHeaderAndFooterRefresh;

//以下可能废弃
- (void)setUpRefreshWithNeedHeaderRefresh:(BOOL)needHeaderRefresh needFooterRefresh:(BOOL)needFooterRefresh;
- (void)headerRereshing;
- (void)footerRereshing;
@end
