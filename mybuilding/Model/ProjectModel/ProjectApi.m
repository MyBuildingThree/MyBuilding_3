//
//  ProjectApi.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectApi.h"
#import "ProjectModel.h"
#import "SendRequst.h"

@implementation ProjectApi
+ (void)GetPiProjectSeachWithBlock:(void (^)(NSMutableArray *, NSError *))block startIndex:(int)startIndex keywords:(NSString *)keywords noNetWork:(void (^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/projects/search?pageSize=5&pageIndex=%d&keywords=%@",startIndex,keywords];
    [SendRequst sendRequestWithUrlString:urlStr success:^(id responseDic) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for (NSDictionary *item in responseDic[@"data"][@"rows"]) {
            ProjectModel *model = [[ProjectModel alloc] init];
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
