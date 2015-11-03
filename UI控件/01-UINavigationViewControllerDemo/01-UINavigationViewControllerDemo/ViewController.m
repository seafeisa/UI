//
//  ViewController.m
//  01-UINavigationViewControllerDemo
//
//  Created by qingyun on 15/10/19.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)leftBarButtonItemAction:(UIBarButtonItem *)sender {
    NSLog(@"菜单");
}
- (IBAction)rightBarButtonItemAction:(UIBarButtonItem *)sender {
    NSLog(@"拍照");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
