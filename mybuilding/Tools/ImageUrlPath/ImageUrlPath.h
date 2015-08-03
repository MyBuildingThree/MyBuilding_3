//
//  ImageUrlPath.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  获取网络图片地址
 */
@interface ImageUrlPath : NSObject
/**
 *  获取网络图片地址 不传宽高获取原图
 *
 *  @param imageID 图片的ID
 *  @param type    图片类型:
 *                 login用户,
 *                 project项目,
 *                 product产品,
 *                 topic项目专题,
 *                 banner广告Banner图片,
 *                 dynamic动态图片
 *  @param width   图片宽
 *  @param height  图片高
 *  @param cut     是否按宽高截图
 *
 *  @return 图片路径
 */
+(NSURL *)getNetWorkImageUrl:(NSString *)imageID type:(NSString *)type width:(NSString *)width height:(NSString *)height cut:(NSString *)cut;
@end
