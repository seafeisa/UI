//
//  ViewController.m
//  04-编辑表视图
//
//  Created by qingyun on 15/10/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableDictionary *dictionary;
@property (nonatomic, strong) NSArray *keys;
@end

@implementation ViewController
static NSString *identifier = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //向tableView注册单元格
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    //初始化数据
    [self loadDictionaryFromFile];
    
    
    //添加右边的UIBarButtonItem
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editAction:)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    //[_tableView setEditing:YES animated:YES];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)editAction:(UIBarButtonItem *)barButtonItem
{
    if ([barButtonItem.title isEqualToString:@"编辑"]) {
        [_tableView setEditing:YES animated:YES];
        barButtonItem.title = @"完成";
    }else{
        [_tableView setEditing:NO animated:YES];
        barButtonItem.title = @"编辑";
    }
}

-(void)loadDictionaryFromFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    _dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    //所有键
    NSArray *allkeys = _dictionary.allKeys;
    //键排序
    _keys = [allkeys sortedArrayUsingSelector:@selector(compare:)];
}

#pragma mark -UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _keys.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //当前section在字典中所对应的键
    NSString *key = _keys[section];
    //取当前section所有的数据
    NSArray *array = _dictionary[key];
    
    return array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //当前section在字典中所对应的键
    NSString *key = _keys[indexPath.section];
    //取当前section所有的数据
    NSArray *array = _dictionary[key];
    
    cell.textLabel.text = array[indexPath.row];
    return cell;
}


//设置section的头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _keys[section];
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}


//编辑（增加，删除）

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

//指定编辑风格
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2) {//奇数行
        return UITableViewCellEditingStyleInsert;
    }else{//偶数
        return UITableViewCellEditingStyleDelete;
    }
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //取出当前行所在的sction的数据
    //1、取section对应的key
    NSString *key = _keys[indexPath.section];
    //2、通过key从字典中取出array
    NSMutableArray *array = (NSMutableArray *)_dictionary[key];
    
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        //更改数据源
        [array insertObject:@"青云iOS" atIndex:indexPath.row + 1];
        //更改界面
        NSIndexPath *addIndexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
        
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:addIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
    }else if (editingStyle == UITableViewCellEditingStyleDelete){
        //更改数据源
        [array removeObjectAtIndex:indexPath.row];
        
        //更改界面
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
    }
}


//移动

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //取出源单元格所在的section的数据
    //取当前section在字典中对应的键
    NSString *sourceKey = _keys[sourceIndexPath.section];
    //拿键取section的数据
    NSMutableArray *sourceArray = _dictionary[sourceKey];
    //移动的单元格的内容
    NSString *sourceString = sourceArray[sourceIndexPath.row];
    //从sourceArray中删除sourceString
    [sourceArray removeObjectAtIndex:sourceIndexPath.row];
    
    //取出目标的单元格所在的section的数据
    //取当前目标section在字典中对应的键
    NSString *destionationKey = _keys[destinationIndexPath.section];
    //取目标section的数据
    NSMutableArray *destinationArray = _dictionary[destionationKey];
    
    //把移动的数据插入到destinationArray
    [destinationArray insertObject:sourceString atIndex:destinationIndexPath.row];

}


@end
