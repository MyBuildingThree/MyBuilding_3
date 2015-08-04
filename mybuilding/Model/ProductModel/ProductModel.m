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
    self.a_productOriginImageUrl = [ImageUrlPath getNetWorkImageUrl:dict[@"productImagesId"] type:@"product" width:[NSString stringWithFormat:@"%f",kScreenWidth] height:@"" cut:@""];
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
}
@end
