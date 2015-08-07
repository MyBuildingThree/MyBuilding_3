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
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithCustomView:searchBtn];
    
    UIButton *moreBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    UIBarButtonItem *moreItem = [[UIBarButtonItem alloc]initWithCustomView:moreBtn];
    
    self.navigationItem.rightBarButtonItems = @[moreItem,searchItem];
}

- (void)stageViewPageControllerAssistBtnClicked{
    NSLog(@"22");
}
@end
