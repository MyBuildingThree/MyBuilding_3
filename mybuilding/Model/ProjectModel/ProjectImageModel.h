//
//  ProjectImageModel.h
//  mybuilding
//
//  Created by 汪洋 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectImageModel : NSObject
/**
 *  项目图片的ID
 */
@property (nonatomic,strong) NSString *a_imageID;

/**
 *  图片所在项目的ID
 */
@property (nonatomic,strong) NSString *a_projectId;

/**
 *  图片小图
 */
@property (nonatomic,strong) NSURL *a_imageCompressLocation;

/**
 *  图片大图
 */
@property (nonatomic,strong) NSURL *a_imageOriginalLocation;

/**
 *  图片原图的高
 */
@property(nonatomic,strong)NSString* a_imageHeight;

/**
 *  图片原图的宽
 */
@property(nonatomic,strong)NSString* a_imageWidth;

@property (nonatomic, copy) NSDictionary *dict;
@end
