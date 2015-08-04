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

/**
 *  查看手机号/用户名是否存在于我们服务器
 *
 *  @param block     回调给页面的数据 statusCode
 *  @param userName  传递给服务器的数据 手机号或者用户名
 *  @param noNetWork 是否网络连接
 */
+ (void)GetIsExistWithBlock:(void (^)(NSDictionary *item, NSError *error))block userName:(NSString*)userName noNetWork:(void(^)())noNetWork;


/**
 *  获取验证码 post
 *
 *  @param block     回调给页面的数据
 *  @param dic       传递给服务器的数据
 *                   cellPhone 发送的手机号码
 *                   codeType 验证码的用处 00注册 01密码找回
 *  @param noNetWork 是否网络连接
 */
+ (void)GenerateWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork;

/**
 *  验证手机验证码 get
 *
 *  @param block     回调给页面的数据
 *  @param cellPhone 手机号码
 *  @param code      验证码
 *  @param noNetWork 是否网络连接
 */
+ (void)VerifyCodeWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block cellPhone:(NSString *)cellPhone code:(NSString *)code noNetWork:(void(^)())noNetWork;

/**
 *  注册接口 post
 *
 *  @param block     回调给页面的数据 LoginModel
 *  @param dic       传递给服务器的数据
 *                   cellPhone 注册的手机号码，
 *                   password  注册密码 md5加密，
 *                   deviceType 登录设备，05表示手机端，
 *                   barCode   验证码，
 *                   username  注册的用户名，
 *                   token     ios推送口令牌，
 *                   downloadType ios设备登录证书区分，01是99正式，02是299证书
 *  @param noNetWork 是否网络连接
 */
+ (void)RegisterWithBlock:(void (^)(LoginModel *loginModel, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork;

/**
 *  用户退出 post
 *
 *  @param block     回调给页面的数据
 *  @param noNetWork 是否网络连接
 */
+ (void)LogoutWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block noNetWork:(void(^)())noNetWork;

/**
 *  修改密码 post
 *
 *  @param block     回调给页面的数据
 *  @param dic       传递给服务器的数据
 *                   oldPassword  旧的密码
 *                   newPassword  新的密码
 *  @param noNetWork 是否网络连接
 */
+ (void)ChangePasswordWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork;

/**
 *  忘记密码重新设置新密码 post
 *
 *  @param block     回调给页面的数据
 *  @param dic       传递给服务器的数据
 *                   barCode 验证码
 *                   password 新密码
 *                   cellPhone 手机号码
 *  @param noNetWork 是否网络连接
 */
+ (void)FindPasswordWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork;
@end
