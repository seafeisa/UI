//
//  ViewController.m
//  01-UISearchBarDemo
//
//  Created by qingyun on 15/10/28.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong)NSDictionary *dict;
@property (nonatomic, strong)NSArray *keys;

@property (nonatomic, strong)NSMutableArray *results;

//搜索状态
@property (nonatomic)BOOL isSearching;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDictFromFile];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadDictFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
    _keys = [_dict.allKeys sortedArrayUsingSelector:@selector(compare:)];
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (_isSearching) {
        return 1;
    }
    return _keys.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_isSearching) {
        return _results.count;
    }
    NSString *key = _keys[section];
    NSArray *array = _dict[key];
    return array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (_isSearching) {
        cell.textLabel.text = _results[indexPath.row];
    }else{
        NSString *key = _keys[indexPath.section];
        NSArray *array = _dict[key];
        cell.textLabel.text = array[indexPath.row];
    }
    
    return cell;
}

//设置section标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (_isSearching) {
        return nil;
    }
    return _keys[section];
}

//设置索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (_isSearching) {
        return nil;
    }
    return _keys;
}

#pragma mark -UISearchBarDelegate
//开始编辑
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    //显示取消按钮
    searchBar.showsCancelButton = YES;
    NSLog(@"%@",searchBar.text);
}
//点击取消按钮的时候
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    //隐藏取消按钮
    searchBar.showsCancelButton = NO;
    //取消searchBar的第一响应
    [searchBar resignFirstResponder];
    //清除文本
    searchBar.text = nil;
    
    //更改搜索状态
    _isSearching = NO;
    [_tableView reloadData];
}

//点击键盘搜索
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    searchBar.showsCancelButton = NO;
}

- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return YES;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText isEqualToString:@""]) {//clear
        _isSearching = NO;
        [_tableView reloadData];
        return;
    }
    
    _isSearching = YES;
    
    //搜索关键字
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[CD] %@",searchText];
    
    NSMutableArray *resultArr = [NSMutableArray array];
    for (NSString *key in _keys) {
        NSArray *array = _dict[key];
        NSArray * resultArray = [array filteredArrayUsingPredicate:predicate];
        [resultArr addObjectsFromArray:resultArray];
    }
    _results = resultArr;
    [_tableView reloadData];
}


@end
