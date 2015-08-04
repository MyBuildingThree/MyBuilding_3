//
//  RecommendApi.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RecommendApi.h"
#import "RecommendModel.h"
#import "SendRequst.h"

@implementation RecommendApi
+(void)getAllRecommendInfo:(void (^)(NSMutableArray *posts, NSError *error))block startIndex:(NSInteger)startIndex noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/recommend/getAllRecommendInfo?pageSize=10&pageIndex=%ld",(long)startIndex];
    [SendRequst sendRequestWithUrlString:urlStr success:^(id responseDic) {
        NSLog(@"%@",responseDic);
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for(NSDictionary *item in responseDic[@"data"][@"rows"]){
            RecommendModel *model = [[RecommendModel alloc] init];
            [model setDict:item];
            [arr addObject:model];
        }
        if(block){
            block(arr,nil);
        }
    } failure:^(NSError *error) {
        
    } noNetWork:noNetWork];
}
@end
