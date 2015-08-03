//
//  LoginSqlite.m
//  mybuilding
//
//  Created by 汪洋 on 15/7/31.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "LoginSqlite.h"
#import "FMDB.h"

@implementation LoginSqlite
+(void)opensql{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documents = [paths objectAtIndex:0];
    NSString *database_path = [documents stringByAppendingPathComponent:DataBaseName];
    NSLog(@"%@",database_path);
    FMDatabase *db = [FMDatabase databaseWithPath:database_path];
    
    if ([db open]) {
        NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS Login (ID TEXT, UserName TEXT)"];
        BOOL res = [db executeUpdate:sqlCreateTable];
        if (!res) {
            NSLog(@"error when creating db table");
        } else {
            NSLog(@"success to creating db table");
        }
        [db close];
        
    }
}
@end
