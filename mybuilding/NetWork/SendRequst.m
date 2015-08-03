//
//  SendRequst.m
//  KeychainDemo
//
//  Created by 汪洋 on 15/7/29.
//  Copyright (c) 2015年 汪洋. All rights reserved.
//

#import "SendRequst.h"
#import "AFAppDotNetAPIClient.h"
#import "ConnectionAvailable.h"

@implementation SendRequst

+ (void) sendRequestWithUrlString : (NSString*) urlString
                           success:(void (^)(id responseDic)) success
                           failure:(void(^)(NSError *error)) failure
                         noNetWork:(void (^)())noNetWork{
    
    NSLog(@"urlString=========%@",urlString);
    if(![ConnectionAvailable isConnectionAvailable]){
        if(noNetWork){
            noNetWork();
        }
        return;
    }
    
    [[AFAppDotNetAPIClient sharedClient] GET:urlString
                                  parameters:nil
                                     success:^(NSURLSessionDataTask *task, id responseObject) {
                                         [SendRequst dealSuccessWithreRponseObject:responseObject success:success failure:failure];
                                     } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                         NSLog(@"error ===> %@",error);
                                         [SendRequst HudFailWithNetWorkErr:error];
                                     }];
    
    
}

+(void)formRequstWithUrlString:(NSString *)urlString
                  postParamDic:(NSMutableDictionary *)postParamDic
                       success:(void (^)(id responseDic))success
                       failure:(void(^)(NSError *error))failure
                     noNetWork:(void (^)())noNetWork{
    
    NSLog(@"postDic=========%@",postParamDic);
    NSLog(@"urlString=========%@",urlString);
    
    if(![ConnectionAvailable isConnectionAvailable]){
        if(noNetWork){
            noNetWork();
        }
        return;
    }
    
    [[AFAppDotNetAPIClient sharedClient] POST:urlString
                                   parameters:postParamDic
                                      success:^(NSURLSessionDataTask *task, id responseObject) {
                                          [SendRequst dealSuccessWithreRponseObject:responseObject success:success failure:failure];
                                      }
                                      failure:^(NSURLSessionDataTask *task, NSError *error) {
                                          NSLog(@"error ===> %@",error);
                                          [SendRequst HudFailWithNetWorkErr:error];
                                      }];
}

+(void)postImageRequstWithUrlString:(NSString *)urlString
                       postParamDic:(NSMutableDictionary *)postParamDic
                       imageDataArr:(NSMutableArray *)imageDataArr
                            success:(void (^)(id responseDic))success
                            failure:(void(^)(NSError *error))failure
                          noNetWork:(void (^)())noNetWork{
    NSLog(@"postDic=========%@",postParamDic);
    NSLog(@"urlString=========%@",urlString);
    if(![ConnectionAvailable isConnectionAvailable]){
        if(noNetWork){
            noNetWork();
        }
        return;
    }
    
    [[AFAppDotNetAPIClient sharedClient] POST:urlString
                                   parameters:postParamDic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                       [imageDataArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                                           NSLog(@"=====>%lu",(unsigned long)idx);
                                           [formData appendPartWithFileData:obj name:@"file" fileName:[NSString stringWithFormat:@"image_%lu.jpg",(unsigned long)idx] mimeType:@"image/jpg"];
                                       }];
                                   }
                                      success:^(NSURLSessionDataTask *task, id responseObject) {
                                          [SendRequst dealSuccessWithreRponseObject:responseObject success:success failure:failure];
                                      }
                                      failure:^(NSURLSessionDataTask *task, NSError *error) {
                                          NSLog(@"error ===> %@",error);
                                          [SendRequst HudFailWithNetWorkErr:error];
                                      }];
}


/**
 *  处理获取服务器返回成功的数据
 *
 *  @param responseObject json数据
 */
+ (void)dealSuccessWithreRponseObject:(id)responseObject
                              success:(void (^)(id responseDic)) success
                              failure:(void(^)(NSError *error)) failure{
//    NSLog(@"responseObject=========%@",responseObject);
    if ([responseObject[@"status"][@"statusCode"] intValue] == 200) {
        if(success){
            success(responseObject);
        }
    }else{
        NSString *err=[NSString stringWithFormat:@"%@",responseObject[@"status"][@"errorMsg"]];
        NSString *errCode=[NSString stringWithFormat:@"%@",responseObject[@"status"][@"statusCode"]];
        NSError *error=[NSError errorWithDomain:err code:[errCode integerValue] userInfo:nil];
        [SendRequst HudFailWithErrMessage:error];
        if(failure){
            failure(error);
        }
    }
}


/**
 *  处理进入异常错误
 *
 *  @param error 自定义的NSError
 */
+(void)HudFailWithNetWorkErr:(NSError *)error{
    NSLog(@"userInfo-------%@",error.userInfo);
    NSLog(@"%@",error.userInfo[@"NSLocalizedDescription"]);
    [SendRequst AddAlertView:error.userInfo[@"NSLocalizedDescription"]];
}

/**
 *  处理服务器返回的错误
 *
 *  @param error 服务器返回的NSError
 */
+(void)HudFailWithErrMessage:(NSError *)error{
    NSLog(@"===>%@",error.domain);
    NSLog(@"%ld",(long)error.code);
    switch (error.code) {
        case 11004:
            [SendRequst AddAlertView:@"手机号格式错误"];
            break;
        case 11012:
            [SendRequst AddAlertView:@"用户名长度小于6"];
            break;
        case 11013:
            [SendRequst AddAlertView:@"用户名长度大于20"];
            break;
        case 11014:
            [SendRequst AddAlertView:@"用户名不能为纯数字"];
            break;
        case 11015:
            [SendRequst AddAlertView:@"用户名包含特殊字符"];
            break;
        case 11002:
            [SendRequst AddAlertView:@"手机号已被注册"];
            break;
        case 11011:
            [SendRequst AddAlertView:@"用户名已被注册"];
            break;
        case 11005:
            [SendRequst AddAlertView:@"验证码错误"];
            break;
        case 11006:
            [SendRequst AddAlertView:@"验证码过期"];
            break;
        case 11018:
            [SendRequst AddAlertView:@"该用户不存在"];
            break;
        case 11023:
            [SendRequst AddAlertView:@"密码错误"];
            break;
        case 11017:
            [SendRequst AddAlertView:@"该用户已存在"];
            break;
        case 12001:
            [SendRequst AddAlertView:@"真实姓名为空"];
            break;
        case 12002:
            [SendRequst AddAlertView:@"常用邮箱为空"];
            break;
        case 12003:
            [SendRequst AddAlertView:@"公司名称为空"];
            break;
        case 12004:
            [SendRequst AddAlertView:@"申请人身份证为空"];
            break;
        case 12005:
            [SendRequst AddAlertView:@"营业执照为空"];
            break;
        case 12006:
            [SendRequst AddAlertView:@"税务登记证为空"];
            break;
        case 12007:
            [SendRequst AddAlertView:@"组织机构代码证为空"];
            break;
        case 13001:
            [SendRequst AddAlertView:@"公司名称超过30字"];
            break;
        case 13002:
            [SendRequst AddAlertView:@"个人职位超过10字"];
            break;
        case 13003:
            [SendRequst AddAlertView:@"个人介绍超过300字"];
            break;
        case 30001:
            [SendRequst AddAlertView:@"评论内容大于300字"];
            break;
        case 11007:
            [SendRequst AddAlertView:@"一天内已经获取满了N次验证码，请明天再试"];
            break;
        case 11008:
            [SendRequst AddAlertView:@"发送频繁，请稍后再试"];
            break;
        case 11009:  
            [SendRequst AddAlertView:@"短消息发送失败"];
            break;
        case 11024:
            [SendRequst AddAlertView:@"该用户已被删除（拉黑）"];
            break;
        case 11019:
            [SendRequst AddAlertView:@"用户名不符合规则或含企业组织名称，请修改。"];
            break;
        default:
            [SendRequst AddAlertView:error.domain];
            break;
    }
}

+(void)AddAlertView:(NSString *)msg{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}
@end
