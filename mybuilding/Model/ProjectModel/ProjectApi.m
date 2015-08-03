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
/**
 *  项目搜索 get
 *
 *  @param block      接口返回的数据 ProjectModel
 *  @param startIndex 分页 从0开始
 *  @param keywords   搜索的关键字
 *  @param noNetWork  没有网络的情况处理
 */
+ (void)GetPiProjectSeachWithBlock:(void (^)(NSMutableArray *, NSError *))block startIndex:(int)startIndex keywords:(NSString *)keywords noNetWork:(void (^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/projects/search?pageSize=5&pageIndex=%d&keywords=%@",startIndex,keywords];
    [SendRequst sendRequestWithUrlString:urlStr success:^(id responseDic) {
        
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}
@end
