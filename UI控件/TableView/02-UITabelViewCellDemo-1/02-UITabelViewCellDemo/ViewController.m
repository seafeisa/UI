//
//  ViewController.m
//  02-UITabelViewCellDemo
//
//  Created by qingyun on 15/10/24.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *datas;
@end

@implementation ViewController
static NSString *identifier = @"qycell";
- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    //设置数据源和代理
    tableView.delegate = self;
    tableView.dataSource = self;
    
    //[tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
    
    //设置行高
    tableView.rowHeight = 100;
    
    //允许多选
    //tableView.allowsMultipleSelection = YES;
    
    //设置数据
    _datas = @[@"zhangsan",@"lisi",@"wangwu",@"zhaoliu",@"tianqi"];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
#if 1
    static NSString *identifier = @"qycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:indexPath.row % 4 reuseIdentifier:identifier];
        
        //选中风格
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
        //背景
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor blueColor];
        bgView.alpha = 0.2;
        //cell.backgroundView = bgView;
        
        //选中背景
        UIView *selectedBGView = [[UIView alloc] init];
        selectedBGView.backgroundColor = [UIColor redColor];
        //cell.selectedBackgroundView = selectedBGView;
        
        //多选背景
        selectedBGView.backgroundColor = [UIColor greenColor];
        //cell.multipleSelectionBackgroundView = selectedBGView;
        
        //设置辅助 视图
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, 80, 40);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitle:@"详情" forState:UIControlStateNormal];
        //cell.accessoryView = btn;
        
        
        
    }
#else
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
#endif
    
    cell.textLabel.text = _datas[indexPath.row];
    
    cell.detailTextLabel.text = @"这个人很懒";
    
    NSString *imageName = [NSString stringWithFormat:@"icon%ld.jpg",(long)indexPath.row];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    CGRect iconFrame = cell.imageView.frame;
    iconFrame.origin.x += 200;
    cell.imageView.frame = iconFrame;
    
    return cell;
}

@end
