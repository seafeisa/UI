//
//  QYTabBarController.m
//  03-CustomTabBarDemo
//
//  Created by qingyun on 15/10/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYTabBarController.h"

@interface QYTabBarController ()
@property (nonatomic, strong) UIView *underView;
@end

@implementation QYTabBarController
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define QYScreenW [UIScreen mainScreen].bounds.size.width
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置tabbar
    [self setTabBar];
    //绑定视图控制器
    //[self bindViewController];
    // Do any additional setup after loading the view.
}



-(void)setTabBar
{
    //1、设置tabBar的背景 (tabBar的高度49)
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, QYScreenH - 49, QYScreenW, 49)];
    [self.view addSubview:bgView];
    bgView.userInteractionEnabled = YES;
    
    UIImage *image = [UIImage imageNamed:@"tabButtonBackground"];
    UIImage *bgImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(21, 1, 21, 1) resizingMode:UIImageResizingModeStretch];
    
    bgView.image = bgImage;
    
    
    //2、添加视图控制器对应的tabBarItem
    CGFloat space = 20;
    
    CGFloat barItemW = 48;
    CGFloat barItemH = 38;
    
    //计算两个相邻的barItem之间的间距
    CGFloat itemSpace = (QYScreenW - 4 * barItemW - 2 * space) / 3;
    for (int i = 0; i < 4; i++) {
        //计算每一个barItem的位置
        CGFloat barItemX = space + i * (barItemW + itemSpace);
        CGFloat barItemY = (bgView.frame.size.height - barItemH)/2;
        
        UIButton *barItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [bgView addSubview:barItem];
        
        barItem.frame = CGRectMake(barItemX, barItemY, barItemW, barItemH);
        
        NSString *imageName = [NSString stringWithFormat:@"%d",i + 1];
        [barItem setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [barItem addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchUpInside];
        
        barItem.tag = i + 100;
        
    }
    
    //3、在tabBarItem下添加underView
    
    CGFloat underViewW = 52;
    CGFloat underViewH = 42;
    
    UIView *underView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, underViewW, underViewH)];
    [bgView insertSubview:underView atIndex:0];
    
    //设置中心点
    UIButton *btn = (UIButton *)[bgView viewWithTag:100];
    underView.center = btn.center;
    //设置underView的背景颜色
    underView.backgroundColor = [UIColor purpleColor];
    
    _underView = underView;
}

-(void)changeViewController:(UIButton *)sender
{
    //通过Btn的tag值来切换视图控制器
    self.selectedIndex = sender.tag - 100;
    _underView.center = sender.center;
}

@end
