//
//  SearchSqlite.h
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchSqlite : NSObject

+ (NSMutableArray *)openSqlWithClass:(NSString *)classStr;

@end
