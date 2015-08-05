//
//  ProductModel.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProductModel.h"
#import "ImageUrlPath.h"

@implementation ProductModel
-(void)setDict:(NSDictionary *)dict{
    self.a_productID = dict[@"productId"];
    self.a_productName = dict[@"productName"];
    self.a_productDesc = dict[@"productDesc"];
    self.a_productListSmallImageUrl = [ImageUrlPath getNetWorkImageUrl:dict[@"productImagesId"] type:@"product" width:@"80" height:@"80" cut:@"1"];
    self.a_productOriginImageUrl = [ImageUrlPath getNetWorkImageUrl:dict[@"productImagesId"] type:@"product" width:[NSString stringWithFormat:@"%d",(int)IMAGEWIDTH] height:@"" cut:@""];
    NSLog(@"a_productOriginImageUrl ===> %@",self.a_productOriginImageUrl);
    self.a_commentNumber = dict[@"commentsNum"];
    self.a_createdBy = dict[@"createdTime"];
    self.a_avatarUrl = [ImageUrlPath getNetWorkImageUrl:dict[@"loginImagesId"] type:@"login" width:@"" height:@"" cut:@""];
    self.a_userName = dict[@"loginName"];
    if([dict[@"isFocus"] isEqualToString:@"0"]){
        self.a_isFocused = NO;
    }else{
        self.a_isFocused = YES;
    }
    self.a_focusedNum = dict[@"focusNum"];
    self.a_userType = dict[@"userType"];
    
    if(![dict[@"imageWidth"] isEqualToString:@""]){
        CGSize size = [ProductModel getImageWidth:dict[@"imageWidth"] height:dict[@"imageHeight"]];
        self.a_imageWidth = size.width;
        self.a_imageHeight = size.height;
    }else{
        self.a_imageWidth = 0;
        self.a_imageHeight = 0;
    }
}

+(CGSize)getImageWidth:(NSString *)width height:(NSString *)height{
    CGSize newSize ;
    CGFloat newWidth = [width intValue];
    CGFloat newHeight = [height intValue];
    if(newWidth > kScreenWidth){
        newWidth = kScreenWidth;
        double origin = kScreenWidth/[width floatValue];
        newHeight = newHeight*origin;
        newSize.width = (int)newWidth;
        newSize.height = (int)newHeight;
        return newSize;
    }else{
        newSize.width = newWidth;
        newSize.height = newHeight;
        return newSize;
    }
    
}
@end
