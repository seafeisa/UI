//
//  ViewController.m
//  02-UITableViewDemo
//
//  Created by qingyun on 15/10/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>
@property (nonatomic,strong) NSArray *arr;
@end

@implementation ViewController

-(NSArray *)arr
{
    if (_arr == nil) {
        _arr = @[@"飞机"];
    }
    return _arr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStyleGrouped];
    
    [self.view addSubview:tableView];
    
    //tableView.separatorColor = [UIColor redColor];
    
    //设置tableView的数据源的委托
    tableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -UITableViewDataSource

// 多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arr.count;
}

  // 多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

 // 内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"a"];
    
    cell.textLabel.text = self.arr[indexPath.row];
    
    return cell;
}

@end
