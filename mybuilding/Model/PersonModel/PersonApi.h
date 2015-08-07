//
//  PersonApi.h
//  mybuilding
//
//  Created by 孙元侃 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonModel.h"

/**
 *  和人有关的接口
 */
@interface PersonApi : NSObject

/**
 *  搜人的接口
 *
 *  @param block      接口返回的数据 PersonModel
 *  @param keywords   搜索的关键字
 *  @param startIndex 分页 从0开始
 *  @param noNetWork  没有网络的情况处理
 */
+ (void)SearchUserWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block keywords:(NSString *)keywords startIndex:(NSInteger)startIndex noNetWork:(void(^)())noNetWork;

/**
 *   人的详情接口
 *
 *  @param block     接口返回的数据 PersonModel
 *  @param userId    人的ID
 *  @param noNetWork 没有网络的情况处理
 */
+ (void)GetUserInformationWithBlock:(void (^)(PersonModel *model, NSError *error))block userId:(NSString *)userId noNetWork:(void(^)())noNetWork;

/**
 *  上传头像接口
 *
 *  @param block     接口返回的数据
 *  @param data      图片的NSData
 *  @param noNetWork 没有网络的情况处理
 */
+ (void)AddUserImageWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block data:(NSData *)data noNetWork:(void(^)())noNetWork;

/**
 *   更新个人信息
 *
 *  @param block     接口返回的数据
 *  @param dic       传给服务器的数据
 *                   realName      真实姓名，
 *                   email         邮箱，
 *                   sex           性别 00男 01女，
 *                   constel       星座，
 *                   birthday      生日，
 *                   bloodType     血型 01 A型,02 B型，03 AB型，04 O型，05 其他，
 *                   landProvince  省
 *                   landCity      市
 *                   landDistrict  区
 *  @param noNetWork 没有网络的情况处理
 */
+ (void)PostInformationImprovedWithBlock:(void (^)(NSMutableArray *posts, NSError *error))block dic:(NSMutableDictionary *)dic noNetWork:(void(^)())noNetWork;
@end
