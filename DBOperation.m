//
//  DBOperation.m
//  Property
//
//  Created by Tops on 2/16/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import "DBOperation.h"

@implementation DBOperation
@synthesize get_dbpath;
-(id)init
{
    if (self==[super init])
    {
        deli=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        get_dbpath=deli.dbpath;
    }
    return self;
}
-(void)InsUpdDel:(NSString *)query
{
    if (sqlite3_open([get_dbpath UTF8String],&dbsql)==SQLITE_OK)
    {
        sqlite3_stmt *ppStmt;
        if (sqlite3_prepare_v2(dbsql,[query UTF8String],-1,&ppStmt,nil)==SQLITE_OK)
        {
            sqlite3_step(ppStmt);
        }
        sqlite3_finalize(ppStmt);
    }
    sqlite3_close(dbsql);
}
-(NSMutableArray *)SelectAllRecord:(NSString *)query
{
    NSMutableArray *arrmute=[[NSMutableArray alloc]init];
    NSMutableDictionary *dictmute=[[NSMutableDictionary alloc]init];
    if (sqlite3_open([get_dbpath UTF8String],&dbsql)==SQLITE_OK)
    {
        sqlite3_stmt *ppStmt;
        if (sqlite3_prepare_v2(dbsql,[query UTF8String],-1,&ppStmt,nil)==SQLITE_OK)
        {
            while(sqlite3_step(ppStmt)==SQLITE_ROW)
            {
                NSString *a_id=[NSString stringWithFormat:@"%s",sqlite3_column_text(ppStmt,0)];
                NSString *a_nm=[NSString stringWithFormat:@"%s",sqlite3_column_text(ppStmt,1)];
                NSString *a_img=[NSString stringWithFormat:@"%s",sqlite3_column_text(ppStmt,2)];
                
                [dictmute setObject:a_id forKey:@"a_id"];
                [dictmute setObject:a_nm forKey:@"a_nm"];
                [dictmute setObject:a_img forKey:@"a_img"];
                
                [arrmute addObject:[dictmute copy]];
            }
        }
        sqlite3_finalize(ppStmt);
    }
    sqlite3_close(dbsql);
    return arrmute;
}
@end
