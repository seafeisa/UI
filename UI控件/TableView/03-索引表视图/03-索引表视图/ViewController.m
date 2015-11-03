//
//  ViewController.m
//  03-索引表视图
//
//  Created by qingyun on 15/10/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSDictionary *dict;
@property (nonatomic, strong)NSArray *keys;
@property (nonatomic,strong) UISearchBar *searchBar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
   
    
    //初始化数据
    [self loadDictFromFile];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadDictFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    //取出字典中所有的键
    NSArray *keys = _dict.allKeys;
    
    _keys = [keys sortedArrayUsingSelector:@selector(compare:)];
}

#pragma mark -UITableViewDatasource

//返回的section的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _keys.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //取section对应的键
    NSString *key = _keys[section];
    
    NSArray *array = _dict[key];
    
    return array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //取section对应的键
    NSString *key = _keys[indexPath.section];
    //取出当前单元格所在的组数据
    NSArray *array = _dict[key];
    
    cell.textLabel.text = array[indexPath.row];
    return cell;
}

//section的头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _keys[section];
}

//设置索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}

//点击索引
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if (index == 0) {
        return 3;
    }
    return index;
}


@end
