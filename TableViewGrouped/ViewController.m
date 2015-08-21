//
//  ViewController.m
//  TableViewGrouped
//
//  Created by Hu Aihong on 15-8-21.
//  Copyright (c) 2015年 ChinaCloud. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize provinces;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"Provineces" ofType:@"plist"];
    NSMutableArray *array=[[NSMutableArray  alloc] initWithContentsOfFile:plistPath];
    self.provinces = array;
    
}
//这个方法用来告诉表格有几个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [provinces count];
}

//这个方法告诉表格第section个分段有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *cities = [[provinces objectAtIndex:section]objectForKey:@"cities"];
    return [cities count];
}
//这个方法用来告诉某个分组的某一行是什么数据，返回一个UITableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    
    NSArray *cities = [[provinces objectAtIndex:section]objectForKey:@"cities"] ;
    
    
    static NSString *GroupedTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             GroupedTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:GroupedTableIdentifier];
    }
    
    //给Label附上城市名称  key 为：C_Name
    cell.textLabel.text = [[cities objectAtIndex:row] objectForKey:@"CityName"];
    NSLog(@"Test%@",[[cities objectAtIndex:row] objectForKey:@"CityName"]);
    return cell;
}
//这个方法用来告诉表格第section分组的名称
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *provincName = [[provinces objectAtIndex:section] objectForKey:@"ProvinceName"];
    return provincName;
}

//返回所有省份名称的数组 ，通过点击右边的省份名称能快速定位到这个省份的城市，也就是快速定位到这个section

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    //返回省份的数组
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:35];
    for (NSDictionary *dict in provinces) {
        [array addObject:[dict objectForKey:@"ProvinceName"]];
    }
    return array;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
