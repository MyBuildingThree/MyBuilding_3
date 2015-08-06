//
//  PersonApi.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "PersonApi.h"
#import "PersonModel.h"
#import "SendRequst.h"

@implementation PersonApi
+ (void)SearchUserWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block keywords:(NSString *)keywords startIndex:(NSInteger)startIndex noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/search?keywords=%@&pageIndex=%ld&pageSize=15",keywords,(long)startIndex];
    [SendRequst sendRequestWithUrlString:urlStr success:^(id responseDic) {
        NSLog(@"responseDic = %@",responseDic);
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for (NSDictionary *item in responseDic[@"data"][@"rows"]) {
            PersonModel *model = [[PersonModel alloc] init];
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
