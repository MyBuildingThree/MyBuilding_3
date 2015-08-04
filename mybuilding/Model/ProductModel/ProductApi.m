//
//  ProductApi.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProductApi.h"
#import "SendRequst.h"
#import "ProductModel.h"

@implementation ProductApi
+(void)GetProductListWithBlock:(void (^)(NSMutableArray *, NSError *))block startIndex:(NSInteger)startIndex productDesc:(NSString *)productDesc userId:(NSString *)userId productIds:(NSString *)productIds noNetWork:(void (^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/productInfo/getProductInfoPage?pageSize=10&pageIndex=%ld&productDesc=%@&userId=%@&productIds=%@",(long)startIndex,productDesc,userId,productIds];
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlStr, NULL, NULL,  kCFStringEncodingUTF8 ));
    [SendRequst sendRequestWithUrlString:encodedString success:^(id responseDic) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for(NSDictionary *item in responseDic[@"data"][@"rows"]){
            ProductModel *model = [[ProductModel alloc] init];
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
