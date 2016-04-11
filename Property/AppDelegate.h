//
//  AppDelegate.h
//  Property
//
//  Created by Tops on 2/16/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(retain,nonatomic)NSString *dbpath;

@end

