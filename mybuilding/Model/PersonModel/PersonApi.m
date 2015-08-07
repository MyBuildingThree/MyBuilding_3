//
//  PersonApi.m
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "PersonApi.h"
#import "SendRequst.h"

@implementation PersonApi
+ (void)SearchUserWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block keywords:(NSString *)keywords startIndex:(NSInteger)startIndex noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/search?keywords=%@&pageIndex=%ld&pageSize=15",keywords,(long)startIndex];
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlStr, NULL, NULL,  kCFStringEncodingUTF8 ));
    [SendRequst sendRequestWithUrlString:encodedString success:^(id responseDic) {
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

+ (void)GetUserInformationWithBlock:(void (^)(PersonModel *model, NSError *error))block userId:(NSString *)userId noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/userDetails?userId=%@",userId];
    [SendRequst sendRequestWithUrlString:urlStr success:^(id responseDic) {
        NSLog(@"%@",responseDic);
        PersonModel *model = [[PersonModel alloc] init];
        [model setDict:responseDic[@"data"]];
        if(block){
            block(model,nil);
        }
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}

+ (void)AddUserImageWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block data:(NSData *)data noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/addUserImage"];
    [SendRequst postImageRequstWithUrlString:urlStr postParamDic:nil imageDataArr:[NSMutableArray arrayWithObjects:data, nil] success:^(id responseDic) {
        if(block){
            block(nil,nil);
        }
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}

+ (void)PostInformationImprovedWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/updateInformation"];
    [SendRequst formRequstWithUrlString:urlStr postParamDic:dic success:^(id responseDic) {
        if(block){
            block(nil,nil);
        }
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}
@end
