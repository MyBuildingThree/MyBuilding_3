//
//  HomeNavigationController.m
//  TEMP
//
//  Created by ShenjiGroup on 15/7/29.
//  Copyright (c) 2015年 ShenjiGroup. All rights reserved.
//

#import "HomeNavigationController.h"
#import "MyBuildingTabBarController.h"
//#import "PopoverView.h"
//#import "ADCampaignViewController.h"
#import "LoginVC.h"



@interface HomeNavigationController ()

//搜索按钮
@property (nonatomic, strong)UIButton *searchBtn;
//更多按钮
@property (nonatomic, strong)UIButton *moreBtn;
@end

@implementation HomeNavigationController



/**
 *  导航栏的单例方法
 *
 *  @return 返回导航栏控制器
 */
+(HomeNavigationController *)sharedHomeNavigationController
{
    static HomeNavigationController *homeNav = nil;
    
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        homeNav = [HomeNavigationController alloc];
        
    });
    return homeNav;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //定制导航条
    [self customNavigationbar];
}

/**
 *  定制导航条
 */
- (void)customNavigationbar
{
    //self.navigationBar.translucent = NO;
    //设置导航栏颜色(图片),防止系统强制半透明
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *backColorImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.navigationBar setBackgroundImage:backColorImage forBarMetrics:UIBarMetricsDefault];
    
    //标题样式
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:23], NSFontAttributeName,nil]];
    //恢复导航条上的初始子控件
    [self recoverInitialSubviews];
}

/**
 *  恢复导航条上的初始子控件(搜索 和 更多功能)
 */
- (void)recoverInitialSubviews
{
    [self removeSubviews];
    //添加 搜索 按钮
    self.searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(150, 5, 60, 30)];
    //self.searchBtn.backgroundColor = [UIColor brownColor];
    [self.searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [self.searchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.searchBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationBar addSubview:self.searchBtn];
    
    //添加 更多功能 按钮
    self.moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(230, 5, 80, 30)];
    //self.moreBtn.backgroundColor = [UIColor brownColor];
    [self.moreBtn setTitle:@"更多功能" forState:UIControlStateNormal];
    [self.moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.moreBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.moreBtn.tag = 21;
    [self.navigationBar addSubview:self.moreBtn];
    
}

/**
 *  移除导航条上的初始控件
 */
-(void)removeSubviews
{
    for (UIView *obj in self.navigationBar.subviews)
    {
        if (obj == self.searchBtn || obj == self.moreBtn)
        {
            [obj removeFromSuperview];
        }
    }
    
    
}

//重写push pop方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
    if (self.viewControllers.count > 1)
    {
        [self removeSubviews];
    }
}

-(NSArray *)popToRootViewControllerAnimated:(BOOL)animated
{
    [self recoverInitialSubviews];
    NSArray *array = [super popToRootViewControllerAnimated:animated];
    if (animated == YES)
    {
        self.searchBtn.alpha = 0.0;
        self.moreBtn.alpha = 0.0;
        [UIView animateWithDuration:0.3 animations:^{
            self.searchBtn.alpha = 1;
            self.moreBtn.alpha = 1;
        }];
    }
    return array;
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    UIViewController *vc = [super popViewControllerAnimated:animated];
    if (self.viewControllers.count == 1)
    {
        [self recoverInitialSubviews];
        if (animated == YES)
        {
            self.searchBtn.alpha = 0.0;
            self.moreBtn.alpha = 0.0;
            [UIView animateWithDuration:0.3 animations:^{
                self.searchBtn.alpha = 1;
                self.moreBtn.alpha = 1;
            }];
        }
    }
    return vc;
}

/**
 *  导航条上按钮点击事件
 *
 *  @param btn 点击的按钮
 */
- (void)btnClick:(UIButton *)btn
{
//    if ([btn.titleLabel.text isEqualToString:@"更多功能"])
//    {
//        CGPoint point = CGPointMake(btn.frame.origin.x + btn.frame.size.width/2, btn.frame.origin.y+20 + btn.frame.size.height);
//        PopoverView *pop = [[PopoverView alloc]initWithPoint:point titles:@[@"热线电话",@"消息通知",@"广告活动"] images:nil scroller:NO];
//        [pop show];
//        pop.selectRowAtIndex = ^(NSInteger index)
//        {
//            if (index == 2)
//            {
//                [self presentViewController:[[ADCampaignViewController alloc]init] animated:YES completion:^{
//                    
//                }];
//            }
//        };
//    }
    if ([btn.titleLabel.text isEqualToString:@"搜索"])
    {
        [self presentViewController:[[LoginVC alloc]init] animated:YES completion:^{
            
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
