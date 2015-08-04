//
//  CompanyApi.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "CompanyApi.h"
#import "SendRequst.h"
#import "CompanyModel.h"

@implementation CompanyApi
+(void)GetCompanyListWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block startIndex:(NSInteger)startIndex keyWords:(NSString *)keyWords noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/companyInfo/getAllCompanyBaseInformation?keywords=%@&pageSize=5&pageIndex=%ld",keyWords,(long)startIndex];
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlStr, NULL, NULL,  kCFStringEncodingUTF8 ));
    [SendRequst sendRequestWithUrlString:encodedString success:^(id responseDic) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for(NSDictionary *item in responseDic[@"data"][@"rows"]){
            CompanyModel *model = [[CompanyModel alloc] init];
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
