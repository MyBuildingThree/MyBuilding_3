//
//  TestNetWorking.m
//  mybuilding
//
//  Created by 汪洋 on 15/7/29.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "TestNetWorking.h"
#import "SendRequst.h"

@implementation TestNetWorking

+(void)GetMobileBannerImages:(void(^)(NSMutableArray *posts,NSError *error))block noNetWork:(void (^)())noNetWork{
    [SendRequst sendRequestWithUrlString:@"api/banner/getMobileBannerImages" success:^(id responseDic) {
        NSLog(@"%@",responseDic);
        NSMutableArray *mutablePosts = [[NSMutableArray alloc] init];
        for(NSDictionary *item in responseDic[@"data"]){
            NSLog(@"item ===> %@",item);
        }
        if (block) {
            block([NSMutableArray arrayWithArray:mutablePosts] ,nil);
        }
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block([NSMutableArray array], error);
        }
    } noNetWork:noNetWork];
}
@end
