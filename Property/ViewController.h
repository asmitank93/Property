//
//  ViewController.h
//  Property
//
//  Created by Tops on 2/16/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBOperation.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    DBOperation *dbop;
    NSArray *arr_get;
}
@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;
@end

