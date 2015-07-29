//
//  SendRequst.h
//  KeychainDemo
//
//  Created by 汪洋 on 15/7/29.
//  Copyright (c) 2015年 汪洋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SendRequst : NSObject
/**
 *  get请求
 *
 *  @param _urlString url
 *  
 */
+(void)sendRequestWithUrlString:(NSString *)urlString
                        success:(void (^)(id responseDic))success
                        failure:(void(^)(NSError *error))failure
                      noNetWork:(void(^)())noNetWork;


+(void)formRequstWithUrlString:(NSString *)urlString
                  postParamDic:(NSMutableDictionary *)postParamDic
                       success:(void (^)(id responseDic))success
                       failure:(void(^)(NSError *error))failure
                     noNetWork:(void(^)())noNetWork;


+(void)postImageRequstWithUrlString:(NSString *)urlString
                       postParamDic:(NSMutableDictionary *)postParamDic
                       imageDataArr:(NSMutableArray *)imageDataArr
                            success:(void (^)(id responseDic))success
                            failure:(void(^)(NSError *error))failure
                          noNetWork:(void(^)())noNetWork;

@end
