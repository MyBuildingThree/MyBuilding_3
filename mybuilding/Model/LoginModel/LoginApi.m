//
//  LoginApi.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "LoginApi.h"
#import "SendRequst.h"

@implementation LoginApi
+ (void)LoginWithBlock:(void (^)(LoginModel *loginModel, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/login"];
    [SendRequst formRequstWithUrlString:urlStr postParamDic:dic success:^(id responseDic) {
        LoginModel *model = [[LoginModel alloc] init];
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

+ (void)GetIsExistWithBlock:(void (^)(NSDictionary *item, NSError *error))block userName:(NSString*)userName noNetWork:(void(^)())noNetWork{
    userName=userName?userName:@"";
    NSString *urlStr = [NSString stringWithFormat:@"api/account/isExist?userNameOrCellPhone=%@",userName];
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlStr, NULL, NULL,  kCFStringEncodingUTF8 ));
    [SendRequst sendRequestWithUrlString:encodedString success:^(id responseDic) {
        if (block) {
            block(responseDic[@"status"],nil);
        }
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}

+ (void)GenerateWithBlock:(void (^)(NSMutableArray *, NSError *))block dic:(NSMutableDictionary *)dic noNetWork:(void (^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/generate"];
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

+ (void)VerifyCodeWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block cellPhone:(NSString *)cellPhone code:(NSString *)code noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/validCaptcha?cellPhone=%@&captcha=%@",cellPhone,code];
    [SendRequst sendRequestWithUrlString:urlStr success:^(id responseDic) {
        if (block) {
            block(nil, nil);
        }
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}


+ (void)RegisterWithBlock:(void (^)(LoginModel *loginModel, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/register"];
    [SendRequst formRequstWithUrlString:urlStr postParamDic:dic success:^(id responseDic) {
        LoginModel *model = [[LoginModel alloc] init];
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

+ (void)LogoutWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/logout"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:@"05" forKey:@"deviceType"];
    [SendRequst formRequstWithUrlString:urlStr postParamDic:dic success:^(id responseDic) {
        
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}

+ (void)ChangePasswordWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/changePassword"];
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

+ (void)FindPasswordWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/account/resetPassword"];
    [SendRequst formRequstWithUrlString:urlStr postParamDic:dic success:^(id responseDic) {
        if(block){
            block(nil,nil);
        }
    } failure:^(NSError *error) {
        //NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}
@end
