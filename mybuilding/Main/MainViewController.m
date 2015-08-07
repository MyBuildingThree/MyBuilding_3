//
//  MainViewController.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "MainViewController.h"
#import "RKStageViewPageController.h"
#import "RKTestController_1.h"
#import "RKTestController_6.h"
#import "UIView+ViewKit.h"
#import "MainProjectController.h"
#import "MainCompanyController.h"
#import "MainContactController.h"
#import "MainProductController.h"
#import "MainRecommendController.h"
#import "MainRequirementsController.h"
#import "SearchVC.h"
#import "PopoverView.h"
#import "ADScrollView.h"

@interface MainViewController ()<RKStageViewPageControllerDelegate>
@property(nonatomic, strong) RKStageViewPageController* pageController;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    MainRecommendController* vc1 = [[MainRecommendController alloc] initWithNavi:self.navigationController];
    MainProjectController* vc2 = [[MainProjectController alloc] initWithNavi:self.navigationController];
    MainCompanyController* vc3 = [[MainCompanyController alloc] initWithNavi:self.navigationController];
    MainContactController* vc4 = [[MainContactController alloc] initWithNavi:self.navigationController];
    MainProductController* vc5 = [[MainProductController alloc] initWithNavi:self.navigationController];
    MainRequirementsController* vc6 = [[MainRequirementsController alloc] initWithNavi:self.navigationController];

    vc1.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    NSMutableArray* titles = [@[@"推荐",@"项目",@"企业",@"人脉",@"产品",@"需求"] mutableCopy];
    NSMutableArray* controllers = [@[vc1,vc2,vc3,vc4,vc5,vc6] mutableCopy];
    
    self.pageController = [[RKStageViewPageController alloc] initWithTitles:titles controllers:controllers size:CGSizeMake(kScreenWidth, kScreenHeight - 64 - 49)];
    self.pageController.delegate = self;
    [self.pageController.view setMinY:64];
    [self.view addSubview:self.pageController.view];
}

-(void)initNav{
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:19], NSFontAttributeName,nil]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [searchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.tag = 101;
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    
    UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    moreBtn.tag = 102;
    UIBarButtonItem *moreItem = [[UIBarButtonItem alloc]initWithCustomView:moreBtn];
    
    self.navigationItem.rightBarButtonItems = @[moreItem,searchItem];
}

- (void)btnClick:(UIButton *)btn
{
    if (btn.tag == 101) {
        [SearchVC searchWithClass:@[@"用户",@"企业",@"项目",@"产品"] pushBy:self.navigationController];
    } else if(btn.tag == 102){
        CGRect rc = [self.navigationController.navigationBar convertRect:btn.frame toView:[UIApplication sharedApplication].keyWindow];
        
        CGPoint point = CGPointMake(rc.origin.x + rc.size.width/2, rc.origin.y + rc.size.height);
        [PopoverView popUpWithPoint:point titles:@[@"热线电话",@"消息通知",@"广告活动"] images:nil scroller:NO selectTodo:^(NSInteger index) {
            if (index == 2) {
                
                [ADScrollView showADwithImageUrlArray:@[@"http://d.hiphotos.baidu.com/image/pic/item/c9fcc3cec3fdfc03f9a789b6d63f8794a5c226e4.jpg",@"http://a.hiphotos.baidu.com/image/pic/item/d043ad4bd11373f002b33681a60f4bfbfbed041b.jpg",@"http://c.hiphotos.baidu.com/image/pic/item/a08b87d6277f9e2f6d4a83021d30e924b899f3b9.jpg"] jumpToWebUrl:@[@"0www",@"1wwww",@"2wwww"]];
            }
        }];
    }
}

- (void)stageViewPageControllerAssistBtnClicked{
    NSLog(@"22");
}
@end
