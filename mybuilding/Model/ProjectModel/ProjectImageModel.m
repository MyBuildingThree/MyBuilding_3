//
//  ProjectImageModel.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/5.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectImageModel.h"

@implementation ProjectImageModel
-(void)setDict:(NSDictionary *)dict{
    self.a_imageID = dict[@"projectImagesId"];
    self.a_projectId = dict[@"projectId"];
    self.a_imageCompressLocation = [ImageUrlPath getNetWorkImageUrl:dict[@"projectImagesId"] type:@"project" width:[NSString stringWithFormat:@"%d",(int)IMAGEWIDTH] height:IS_IPHONE_6P?@"375":@"250" cut:@"1"];
    NSLog(@"%@",self.a_imageCompressLocation);
    
    self.a_imageOriginalLocation = [ImageUrlPath getNetWorkImageUrl:dict[@"projectImagesId"] type:@"project" width:[NSString stringWithFormat:@"%d",(int)IMAGEWIDTH] height:@"" cut:@""];
    
    self.a_imageHeight=dict[@"imageHeight"];
    self.a_imageWidth=dict[@"imageWidth"];
}
@end
