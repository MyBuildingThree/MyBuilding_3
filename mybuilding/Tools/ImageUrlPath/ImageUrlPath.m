//
//  ImageUrlPath.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ImageUrlPath.h"

@implementation ImageUrlPath
+(NSURL *)getNetWorkImageUrl:(NSString *)imageID type:(NSString *)type width:(NSString *)width height:(NSString *)height cut:(NSString *)cut{
    NSURL *imageUrl = nil;
    if(![imageID isEqualToString:@""]){
        NSString *urlStr = [NSString stringWithFormat:@"%s/image/show?imageId=%@&type=%@&width=%@&height=%@&cut=%@",serverAddress,imageID,type,width,height,cut];
        imageUrl = [NSURL URLWithString:urlStr];
    }
    return imageUrl;
}
@end
