//
//  QYMeViewController.m
//  04-WeiBoBar
//
//  Created by qingyun on 15/10/20.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYMeViewController.h"

@interface QYMeViewController ()

@end

@implementation QYMeViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //设置当前视图控制器所对应的tabBarItem
        UIImage *image = [UIImage imageNamed:@"tabbar_profile"];
        UIImage *selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:image selectedImage:selectedImage];
        
        self.tabBarItem = tabBarItem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view.
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
