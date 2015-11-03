//
//  QYFirstViewController.m
//  02-UITabBarControllerDemoWithCode
//
//  Created by qingyun on 15/10/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYFirstViewController.h"
#import "QYSecondViewController.h"
@interface QYFirstViewController ()

@end

@implementation QYFirstViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        //创建一个tabBarItem
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1];
        //把tabBarItem设置成当前视图控制器在tabBarController里显示的tab
        self.tabBarItem = tabBarItem;
        //设置徽章
        self.tabBarItem.badgeValue = @"10";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 100, 40);
    
    [btn setTitle:@"下一页" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

-(void)next:(UIButton *)sender
{
    QYSecondViewController *secondeVC = [[QYSecondViewController alloc] init];
    
    [self.navigationController pushViewController:secondeVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
