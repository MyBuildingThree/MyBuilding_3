//
//  CommentApi.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/10.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CommentApi.h"
#import "CommentModel.h"
#import "SendRequst.h"

@implementation CommentApi
+ (void)GetEntityCommentsWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block entityId:(NSString *)entityId entityType:(NSString *)entityType startIndex:(int)startIndex noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/comment/listComment?paramId=%@&commentType=%@&pageSize=10&pageIndex=%d",entityId,entityType,startIndex];
    [SendRequst sendRequestWithUrlString:urlStr success:^(id responseDic) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for(NSDictionary *item in responseDic[@"data"][@"rows"]){
            CommentModel *model = [[CommentModel alloc] init];
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
