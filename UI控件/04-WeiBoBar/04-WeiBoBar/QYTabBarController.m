//
//  QYTabBarController.m
//  04-WeiBoBar
//
//  Created by qingyun on 15/10/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYTabBarController.h"
#import "QYHomeViewController.h"
#import "QYMessageViewController.h"
#import "QYDiscoverViewController.h"
#import "QYMeViewController.h"
@interface QYTabBarController ()

@end

@implementation QYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载视图控制器
    //[self loadViewControllers];
    
    //设置tabBar
    [self setTabBar];
    // Do any additional setup after loading the view.
}
//加载视图控制器
-(void)loadViewControllers
{
    QYHomeViewController *homeVC = [[QYHomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    QYMessageViewController *messageVC = [[QYMessageViewController alloc] init];
    UINavigationController *messageNav = [[UINavigationController alloc] initWithRootViewController:messageVC];
    
    QYDiscoverViewController *discoverVC = [[QYDiscoverViewController alloc] init];
    UINavigationController *discoverNav = [[UINavigationController alloc] initWithRootViewController:discoverVC];
    
    QYMeViewController *meVC = [[QYMeViewController alloc] init];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:meVC];
    
    UIViewController *tempVC = [[UIViewController alloc] init];
    
    NSArray *vcs = [NSArray arrayWithObjects:homeNav,messageNav,tempVC,discoverNav,meNav, nil];
    self.viewControllers = vcs;
    
}

//设置tabBar  +
-(void)setTabBar
{
    self.tabBar.tintColor = [UIColor orangeColor];
    
    //添加中间的+按钮 （宽：50 高：40）
    CGFloat btnW = 50;
    CGFloat btnH = 40;
    CGFloat btnX = self.tabBar.center.x - btnW / 2;
    CGFloat btnY = (49 - btnH) / 2;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    [self.tabBar addSubview:btn];
    
    //设置btn的背景颜色
    [btn setBackgroundColor:[UIColor orangeColor]];
    
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(composeAction:) forControlEvents:UIControlEventTouchUpInside];
    //设置btn的圆角
    btn.layer.cornerRadius = 3;
}

-(void)composeAction:(UIButton *)sender
{
    QYMessageViewController *vc = [[QYMessageViewController alloc] init];
    vc.view.backgroundColor = [UIColor purpleColor];
    [self presentViewController:vc animated:YES completion:^{}];
}

@end
