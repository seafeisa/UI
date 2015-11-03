//
//  ViewController.m
//  03-UITableViewDemoStructure
//
//  Created by qingyun on 15/10/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong)NSArray *array;
@end

@implementation ViewController
#define QYScreenW [UIScreen mainScreen].bounds.size.width
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建并添加UITableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
    //设置数据源和代理
    tableView.dataSource = self;
    tableView.delegate = self;
    
    //设置tableView的背景
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:tableView.frame];
    bgImageView.image = [UIImage imageNamed:@"bg.jpg"];
    tableView.backgroundView = bgImageView;
    
    //设置tableView的头尾视图
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 100)];
    headerLabel.backgroundColor = [UIColor orangeColor];
    headerLabel.text = @"TableViewHeaderView";
    headerLabel.font = [UIFont boldSystemFontOfSize:26];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    tableView.tableHeaderView = headerLabel;
    
    UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 100)];
    footerLabel.backgroundColor = [UIColor purpleColor];
    footerLabel.text = @"TableViewFooterView";
    footerLabel.font = [UIFont boldSystemFontOfSize:26];
    footerLabel.textAlignment = NSTextAlignmentCenter;
    tableView.tableFooterView = footerLabel;
    
    //设置section的头尾
    
    // tableView.sectionHeaderHeight = 100;
    // tableView.sectionFooterHeight = 100;
    
    
    //分割线的设置
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.separatorColor = [UIColor blueColor];
    tableView.separatorInset = UIEdgeInsetsMake(0, 50, 0, 100);
    
    //设置行高
    tableView.rowHeight = 100;
    // Do any additional setup after loading the view, typically from a nib.
}

//对array属性进行懒加载
-(NSArray *)array{
    if (_array == nil) {
        _array = [NSArray arrayWithObjects:@"zhangsan",@"lisi",@"wangwu",@"zhaoliu",@"tainqi", nil];
    }
    return _array;
}

#pragma mark  - UITableViewDataSource
//组的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
//每组中行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
//每行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"a"];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}
//设置section的头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"SectionHeaderTitle:%ld",(long)section];
}

//设置section的尾标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"SectionFooterTitle:%ld",(long)section];
}

#pragma mark -UITableViewDelegate
//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 1) {
        return 50;
    }
    return 100;
}
//section的头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 40;
    }
    return 80;
}
//section的尾高
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80;
}
//section的头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *sectionHeaderView = [[UILabel alloc] init];
    sectionHeaderView.text = [NSString stringWithFormat:@"自定义SectionHeaderView:%ld",(long)section];
    sectionHeaderView.textAlignment = NSTextAlignmentCenter;
    sectionHeaderView.font = [UIFont boldSystemFontOfSize:20];
    return sectionHeaderView;
}
//section的尾视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UILabel *sectionFooterView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 40)];
    sectionFooterView.text = [NSString stringWithFormat:@"自定义SectionFooterView:%ld",(long)section];
    sectionFooterView.textAlignment = NSTextAlignmentCenter;
    sectionFooterView.font = [UIFont boldSystemFontOfSize:20];
    return sectionFooterView;
}

//将要选中行
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSIndexPath *inPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
    return indexPath;
}
//将要取消选中行
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

// 已经选中或已经不再选中某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedString = [NSString stringWithFormat:@"%@ section:%ld, row:%ld",self.array[indexPath.row],indexPath.section,indexPath.row];
    
    UITableViewCell *selectCell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSLog(@"选中cell:%@",selectCell.textLabel.text);
    NSLog(@"选中:%@",selectedString);
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selectedString = [NSString stringWithFormat:@"%@ section:%ld, row:%ld",self.array[indexPath.row],indexPath.section,indexPath.row];
    NSLog(@"取消:%@",selectedString);
}
@end
