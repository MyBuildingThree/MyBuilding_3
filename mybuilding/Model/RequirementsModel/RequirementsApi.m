//
//  RequirementsApi.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RequirementsApi.h"
#import "SendRequst.h"

@implementation RequirementsApi
+ (void)GetAllPublicListWithBlock:(void (^)(NSMutableArray *posts,NSError *error))block startIndex:(NSInteger)startIndex keywords:(NSString *)keywords noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/require/pageRequire?pageSize=5&pageIndex=%ld&requireType=&keywords=%@",(long)startIndex,keywords];
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlStr, NULL, NULL,  kCFStringEncodingUTF8 ));
    [SendRequst sendRequestWithUrlString:encodedString success:^(id responseDic) {
        
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}
@end
