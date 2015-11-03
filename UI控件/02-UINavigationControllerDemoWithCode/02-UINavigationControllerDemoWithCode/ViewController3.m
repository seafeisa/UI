//
//  ViewController3.m
//  02-UINavigationControllerDemoWithCode
//
//  Created by qingyun on 15/10/19.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = backItem;
    // Do any additional setup after loading the view.
}

-(void)back:(UIBarButtonItem *)backItem
{
    //当前视图控制器出栈
    UIViewController *viewController = self.navigationController.viewControllers[0];
    //出栈  根视图控制器
    //[self.navigationController popToRootViewControllerAnimated:YES];
    
    //出栈  指定视图控制器
    [self.navigationController popToViewController:viewController animated:YES];
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
