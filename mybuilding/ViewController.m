//
//  ViewController.m
//  mybuilding
//
//  Created by 汪洋 on 15/7/29.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ViewController.h"
#import "TestNetWorking.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [TestNetWorking GetMobileBannerImages:^(NSMutableArray *posts, NSError *error) {
        
    } noNetWork:^{
        NSLog(@"asdfasdfasdfasdf");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
