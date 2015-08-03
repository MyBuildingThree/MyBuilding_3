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
#import "RKTestController_2.h"
#import "RKTestController_3.h"
#import "RKTestController_4.h"
#import "RKTestController_5.h"
#import "RKTestController_6.h"
#import "UIView+ViewKit.h"
#import "MainContactController.h"
@interface MainViewController ()<RKStageViewPageControllerDelegate>
@property(nonatomic, strong) RKStageViewPageController* pageController;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:19], NSFontAttributeName,nil]];
    self.view.backgroundColor = [UIColor whiteColor];
    RKTestController_1* vc1 = [[RKTestController_1 alloc] init];
    RKTestController_2* vc2 = [[RKTestController_2 alloc] init];

    RKTestController_3* vc3 = [[RKTestController_3 alloc] init];
    MainContactController* vc4 = [[MainContactController alloc] init];
    RKTestController_5* vc5 = [[RKTestController_5 alloc] init];
    RKTestController_6* vc6 = [[RKTestController_6 alloc] init];

    vc1.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    NSMutableArray* titles = [@[@"推荐",@"项目",@"企业",@"人脉",@"产品",@"需求"] mutableCopy];
    NSMutableArray* controllers = [@[vc1,vc2,vc3,vc4,vc5,vc6] mutableCopy];
    
    self.pageController = [[RKStageViewPageController alloc] initWithTitles:titles controllers:controllers size:CGSizeMake(kScreenWidth, kScreenHeight - 64 - 49)];
    self.pageController.delegate = self;
    [self.pageController.view setMinY:0];
    [self.view addSubview:self.pageController.view];
    //
}

- (void)stageViewPageControllerAssistBtnClicked{
    NSLog(@"22");
}
@end
