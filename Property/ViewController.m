//
//  ViewController.m
//  Property
//
//  Created by Tops on 2/16/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tbl_vw;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    dbop=[[DBOperation alloc]init];
    
    NSURL *url=[NSURL URLWithString:@"https://raw.githubusercontent.com/harshadura/WallpaperApps-Service-Endpoints/master/fifa-free-manifest.json"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray *arr=[[[dict objectForKey:@"category"]objectAtIndex:0]objectForKey:@"wallpaper"];
    
    [dbop InsUpdDel:@"delete from actor"];//
    
    for (int i=0; i<arr.count; i++)
    {
        NSString *query=[NSString stringWithFormat:@"insert into actor(a_nm,a_img)values('%@','%@')",[[arr objectAtIndex:i]objectForKey:@"name"],[[arr objectAtIndex:i]objectForKey:@"url"]];
        [dbop InsUpdDel:query];
    }
    arr_get=[dbop SelectAllRecord:@"select * from actor"];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr_get.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[[arr_get objectAtIndex:indexPath.row]objectForKey:@"a_nm"];
    NSURL *url=[NSURL URLWithString:[[arr_get objectAtIndex:indexPath.row]objectForKey:@"a_img"]];
    NSLog(@"%@",url);
    NSData *data=[NSData dataWithContentsOfURL:url];
    cell.imageView.image=[UIImage imageWithData:data];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
