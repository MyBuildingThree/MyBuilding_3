//
//  RequirementsApi.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/6.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RequirementsApi.h"
#import "SendRequst.h"
#import "RequirementsModel.h"

@implementation RequirementsApi
+ (void)GetAllPublicListWithBlock:(void (^)(NSMutableArray *posts,NSError *error))block startIndex:(NSInteger)startIndex keywords:(NSString *)keywords noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/require/pageRequire?pageSize=5&pageIndex=%ld&requireType=&keywords=%@",(long)startIndex,keywords];
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlStr, NULL, NULL,  kCFStringEncodingUTF8 ));
    [SendRequst sendRequestWithUrlString:encodedString success:^(id responseDic) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for(NSDictionary *item in responseDic[@"data"][@"rows"]){
            RequirementsModel *model = [[RequirementsModel alloc] init];
            [model setDict:item];
            [arr addObject:model];
        }
        if(block){
            block(arr,nil);
        }
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}
@end
