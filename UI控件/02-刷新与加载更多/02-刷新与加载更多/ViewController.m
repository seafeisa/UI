
//
//  ViewController.m
//  02-刷新与加载更多
//
//  Created by qingyun on 15/10/27.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.rowHeight = 80;
    
    //添加刷新
    UIRefreshControl *freshControl = [[UIRefreshControl alloc] init];
    [_tableView addSubview:freshControl];
    [freshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    //添加footerView（加载更多）
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60);
    [btn setTitle:@"加载更多..." forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(loadMoreSource) forControlEvents:UIControlEventTouchUpInside];
    _tableView.tableFooterView = btn;
    
    //初始化数据
    NSArray *arr = @[@"zhangsan",@"lisi",@"wangwu",@"zhaoliu",@"tianqi",@"songba",@"zhangsan",@"lisi",@"wangwu",@"zhaoliu",@"tianqi",@"songba"];
    _array = [NSMutableArray arrayWithArray:arr];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadMoreSource
{
    NSArray *arr = @[@"zhangsan",@"lisi",@"wangwu",@"zhaoliu",@"tianqi",@"songba",@"zhangsan",@"lisi",@"wangwu",@"zhaoliu",@"tianqi",@"songba"];
    [_array addObjectsFromArray:arr];
    [_tableView reloadData];
}

-(void)refresh:(UIRefreshControl *)fresh
{
     [fresh performSelector:@selector(endRefreshing) withObject:nil afterDelay:2];
}


#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = _array[indexPath.row];
    return cell;
}



#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_tableView.contentOffset.y > _tableView.contentSize.height - _tableView.frame.size.height + 100) {
        [self loadMoreSource];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
