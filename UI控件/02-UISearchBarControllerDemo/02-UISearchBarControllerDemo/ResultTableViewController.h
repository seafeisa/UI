//
//  ResultTableViewController.h
//  02-UISearchBarControllerDemo
//
//  Created by qingyun on 15/10/28.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultTableViewController : UITableViewController<UISearchResultsUpdating>

@property (nonatomic, strong)NSArray *datas;

@end
