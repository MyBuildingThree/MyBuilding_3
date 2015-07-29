//
//  TestNetWorking.h
//  mybuilding
//
//  Created by 汪洋 on 15/7/29.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestNetWorking : NSObject
+(void)GetMobileBannerImages:(void(^)(NSMutableArray *posts,NSError *error))block noNetWork:(void(^)())noNetWork;
@end
