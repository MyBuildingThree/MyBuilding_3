//
//  SearchSqlite.m
//  mybuilding
//
//  Created by ShenjiGroup on 15/8/4.
//  Copyright (c) 2015年 wy. All rights reserved.
//

#import "SearchSqlite.h"
#import "FMDB.h"

@interface SearchSqlite ()
//{
////@property (nonatomic, strong)FMDatabase *db;
//NSMutableArray *_hisArray;
//}
@end

@implementation SearchSqlite

//-(NSMutableArray *)hisArray
//{
//    if (!_hisArray) {
//        _hisArray = [NSMutableArray array];
//    }
//    return _hisArray;
//}

//查询数据
+ (NSMutableArray *)openSqlWithClass:(NSString *)classStr
{
    NSMutableArray *hisArray =[NSMutableArray array];
    
    FMDatabase *db = [FMDatabase databaseWithPath:DataBasePath];
    if ([db open])
    {
        NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS SearchResult (ID text PRIMARY KEY AUTOINCREMENT, Class text, Content text)"];
                                     
        BOOL res = [db executeUpdate:sqlCreateTable];
        if (res)
        {
            FMResultSet *rs = [db executeQuery:@"select * from SearchResult"];
            while ([rs next])
            {
                if ([[rs stringForColumn:@"Class"] isEqualToString:classStr])
                {
                    [hisArray addObject:[rs stringForColumn:@"Content"]];
                }
            }
        }
        [db close];
    }
    return hisArray;
}

//增加数据
+ (void)addDataWith:(NSString *)classStr content:(NSString *)contentStr
{
    FMDatabase *db = [FMDatabase databaseWithPath:DataBasePath];
    if ([db open])
    {
        NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS SearchResult (ID integer PRIMARY KEY AUTOINCREMENT, Class text, Content text)"];
        
        BOOL res = [db executeUpdate:sqlCreateTable];
        if (res)
        {
            //[SearchSqlite getHistoryWith:classStr];
            FMResultSet *rs = [db executeQuery:@"select * from SearchResult where Content = ?",contentStr];
            while ([rs next])
            {
                if ([[rs stringForColumn:@"Class"] isEqualToString:classStr])
                {
                    [db executeUpdate:@"delete from SearchResult where ID = ?",[rs stringForColumn:@"ID"]];
                }
            }
            [db executeUpdate:@"INSERT INTO SearchResult (Class, Content) VALUES(?,?)",classStr,contentStr];
        }
    }
    [db close];
}
    
//删除数据
+ (void)deleteDataWith:(NSString *)classStr
{
    FMDatabase *db = [FMDatabase databaseWithPath:DataBasePath];
    if ([db open])
    {
        NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS SearchResult (ID integer PRIMARY KEY AUTOINCREMENT, Class text, Content text)"];
        
        BOOL res = [db executeUpdate:sqlCreateTable];
        if (res)
        {
            //[SearchSqlite getHistoryWith:classStr];
            FMResultSet *rs = [db executeQuery:@"select * from SearchResult where Class = ?",classStr];
            while ([rs next])
            {
                [db executeUpdate:@"delete from SearchResult where ID = ?",[rs stringForColumn:@"ID"]];
            }
        }
    }
    [db close];
}


@end
