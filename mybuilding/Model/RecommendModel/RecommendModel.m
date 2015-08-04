//
//  RecommendModel.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel
-(void)setDict:(NSDictionary *)dict{
    if([dict[@"sourceType"] isEqualToString:@"01"]){
        self.a_personModel = [[PersonModel alloc] init];
        [self.a_personModel setDict:dict];
        self.a_sourceType = 1;
    }else if ([dict[@"sourceType"] isEqualToString:@"02"]){
        self.a_companyModel = [[CompanyModel alloc] init];
        [self.a_companyModel setDict:dict];
        self.a_sourceType = 2;
    }else if ([dict[@"sourceType"] isEqualToString:@"03"]){
        self.a_projectModel = [[ProjectModel alloc] init];
        [self.a_projectModel setDict:dict];
        self.a_sourceType = 3;
    }else if ([dict[@"sourceType"] isEqualToString:@"04"]){
        self.a_productModel = [[ProductModel alloc] init];
        [self.a_productModel setDict:dict];
        self.a_sourceType = 4;
    }else if ([dict[@"sourceType"] isEqualToString:@"05"]){
        self.a_sourceType = 5;
    }
}
@end
