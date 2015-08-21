//
//  ViewController.h
//  TableViewGrouped
//
//  Created by Hu Aihong on 15-8-21.
//  Copyright (c) 2015年 ChinaCloud. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSArray *provinces;

@end

