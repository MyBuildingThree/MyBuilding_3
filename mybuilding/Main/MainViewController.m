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

@interface MainViewController ()
@property(nonatomic, strong) RKStageViewPageController* pageController;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:19], NSFontAttributeName,nil]];
    
    RKTestController_1* vc1 = [[RKTestController_1 alloc] init];
    RKTestController_2* vc2 = [[RKTestController_2 alloc] init];

    RKTestController_3* vc3 = [[RKTestController_3 alloc] init];
    RKTestController_4* vc4 = [[RKTestController_4 alloc] init];
    RKTestController_5* vc5 = [[RKTestController_5 alloc] init];
    RKTestController_6* vc6 = [[RKTestController_6 alloc] init];

    NSArray* ary = @[vc1,vc2,vc3,vc4,vc5,vc6];
    
    self.pageController = [[RKStageViewPageController alloc] initWithTitles:@[@"1",@"2",@"3",@"4",@"5",@"6"] controllers:ary];
    [self.view addSubview:self.pageController.view];
}

@end
