//
//  ProjectApi.m
//  mybuilding
//
//  Created by 汪洋 on 15/8/3.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "ProjectApi.h"
#import "SendRequst.h"
#import "ProjectContactModel.h"
#import "ProjectImageModel.h"

@implementation ProjectApi
+ (void)GetPiProjectSeachWithBlock:(void (^)(NSMutableArray *, NSError *))block startIndex:(NSInteger)startIndex keywords:(NSString *)keywords noNetWork:(void (^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/projects/search?pageSize=5&pageIndex=%ld&keywords=%@",(long)startIndex,keywords];
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes( kCFAllocatorDefault, (CFStringRef)urlStr, NULL, NULL,  kCFStringEncodingUTF8 ));
    [SendRequst sendRequestWithUrlString:encodedString success:^(id responseDic) {
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        for (NSDictionary *item in responseDic[@"data"][@"rows"]) {
            ProjectModel *model = [[ProjectModel alloc] init];
            [model setDict:item];
            [arr addObject:model];
        }
        if(block){
            block(arr,nil);
        }
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, error);
        }
    } noNetWork:noNetWork];
}

+ (void)GetProjectInfoWithBlock:(void (^)(ProjectModel *proModel, NSMutableArray *contactArr, NSMutableArray *imageArr ,NSError *error))block projectId:(NSString *)projectId noNetWork:(void(^)())noNetWork{
    NSString *urlStr = [NSString stringWithFormat:@"api/projects/info?projectId=%@",projectId];
    [SendRequst sendRequestWithUrlString:urlStr success:^(id responseDic) {
        ProjectModel *proModel = [[ProjectModel alloc] init];
        NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] init];
        [dataDic setValuesForKeysWithDictionary:responseDic[@"data"][@"info"]];
        [dataDic setValuesForKeysWithDictionary:responseDic[@"data"][@"firstStage"]];
        [dataDic setValuesForKeysWithDictionary:responseDic[@"data"][@"secondStage"]];
        [dataDic setValuesForKeysWithDictionary:responseDic[@"data"][@"thirdStage"]];
        [dataDic setValuesForKeysWithDictionary:responseDic[@"data"][@"forthStage"]];
        [proModel setDict:dataDic];
        
        NSMutableArray *contactArr = [[NSMutableArray alloc] init];
        for(NSDictionary *item in responseDic[@"data"][@"contacts"]){
            ProjectContactModel *model = [[ProjectContactModel alloc] init];
            [model setDict:item];
            [contactArr addObject:model];
        }
        
        NSMutableArray *imageArr = [[NSMutableArray alloc] init];
        for(NSDictionary *item in responseDic[@"data"][@"images"]){
            ProjectImageModel *model = [[ProjectImageModel alloc] init];
            [model setDict:item];
            [imageArr addObject:model];
        }
        if(block){
            block(proModel,contactArr,imageArr,nil);
        }
    } failure:^(NSError *error) {
        NSLog(@"error===>%@",error);
        if (block) {
            block(nil, nil,nil,error);
        }
    } noNetWork:noNetWork];
}
@end
