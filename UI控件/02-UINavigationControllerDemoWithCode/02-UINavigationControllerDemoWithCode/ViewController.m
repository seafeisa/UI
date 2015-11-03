//
//  ViewController.m
//  02-UINavigationControllerDemoWithCode
//
//  Created by qingyun on 15/10/19.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    //设置导航栏
    [self setNavigationBar];
    
    //设置工具栏
    [self setToolBar];
    
    self.navigationController.navigationBar.translucent = NO;
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:nextBtn];
    nextBtn.frame = CGRectMake(100, 100, 100, 40);
    [nextBtn setTitle:@"下一页" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [nextBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)next:(UIButton *)sender
{
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    
    //把vc2压栈到导航控制器中
    [self.navigationController pushViewController:vc2 animated:YES];
}

-(void)setToolBar
{
    //设置工具栏显示
    self.navigationController.toolbarHidden = NO;
    
    //创建工具栏上添加的UIBarButtonItems
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:nil];
    
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:nil];
    
    UIBarButtonItem *trashItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:nil];
    
    //创建barButtonItem的间隔
    //UIBarButtonSystemItemFixedSpace固定间距
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    fixedSpace.width = 100;
    //UIBarButtonSystemItemFlexibleSpace 不固定间距
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //把UIBarButtonItems添加在导航控制器的工具栏上
    NSArray *items = [NSArray arrayWithObjects:fixedSpace,addItem,flexibleSpace,editItem,flexibleSpace,trashItem,flexibleSpace, nil];
    
    [self setToolbarItems:items animated:YES];
}

-(void)setNavigationBar
{
    //导航栏 （leftBarButtonItem、title、rightBarButtonItem）
    //导航栏的高度44，状态栏20 工具栏 44
   //创建左右barButtonItem
#if 0
    //1、系统类型的
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(barBtnItemClick:)];
    
    //2、用标题创建BarButtonItem
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"搜索" style:UIBarButtonItemStylePlain target:self action:@selector(barBtnItemClick:)];
    
    //3、用图片创建BarButtonItem（1、不带横竖屏状态，2、带横竖屏状态）
    //保持原有的图片（不受导航栏上的tintColor的影响）
    UIImage *leftBarBtnImage = [[UIImage imageNamed:@"navigationbar_pop_os7"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithImage:leftBarBtnImage style:UIBarButtonItemStylePlain target:self action:@selector(barBtnItemClick:)];
#endif
    
    //4、自定义view的方式创建BarButtonItem
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置btn的标题要指定btn的状态
    //leftBtn.titleLabel.text = @"搜索";
    [leftBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //设置btn的frame
    leftBtn.frame = CGRectMake(0, 0, 60, 40);
    [leftBtn addTarget:self action:@selector(barBtnItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    leftBarBtnItem.tag = 1;
    
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_compose_os7"] style:UIBarButtonItemStylePlain target:self action:@selector(barBtnItemClick:)];
    rightBarBtnItem.tag = 2;
    
    
    //设置左右barButtonItem
     self.navigationItem.leftBarButtonItem = leftBarBtnItem;
    
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    //设置title
    
    NSArray *items = [NSArray arrayWithObjects:@"所有来电",@"未接来电", nil];
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:items];
    //设置导航控制器的titleView
    self.navigationItem.titleView = segmentControl;
    
    
    //对导航栏设置背景
    
    UIImage *bgImage = [UIImage imageNamed:@"bgimgae"];
    //拉伸过之后的image
    UIImage *image = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(10, 4, 40, 2) resizingMode:UIImageResizingModeStretch];
    
    //[self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    //设置barTintColor
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    
    //设置tintcolor
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    
}


-(void)barBtnItemClick:(UIBarButtonItem *)barBtnItem
{
    
    
    if (barBtnItem.tag == 1) {
        NSLog(@"barBtnItemClick");
    }
}


-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.toolbarHidden = NO;
    
    self.navigationController.hidesBarsOnTap = YES;
}
@end
