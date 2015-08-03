//
//  LoginApi.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

/**
 *  登录，注册，忘记密码，修改密码接口
 */
@interface LoginApi : NSObject
/**
 *  登录接口 post
 *
 *  @param block     回调给页面的数据 LoginModel
 *  @param dic       传递给服务器的数据
 *                   deviceType = 05;登录设备，05表示手机端
 *                   downloadType = 02;ios设备登录证书区分，01是99正式，02是299证书
 *                   password = 965eb72c92a549dd;登录密码 md5加密
 *                   token = "";ios推送口令牌
 *                   userNameOrCellPhone = wy0001; 登录用户名
 *  @param noNetWork 是否网络连接
 */
+ (void)LoginWithBlock:(void (^)(LoginModel *loginModel, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork;
@end
