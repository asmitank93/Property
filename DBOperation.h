//
//  DBOperation.h
//  Property
//
//  Created by Tops on 2/16/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
@interface DBOperation : NSObject
{
    sqlite3 *dbsql;
    AppDelegate *deli;
}
@property(retain,nonatomic)NSString *get_dbpath;
-(void)InsUpdDel:(NSString *)query;
-(NSMutableArray *)SelectAllRecord:(NSString *)query;
@end
