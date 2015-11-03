//
//  UIAlertViewController.m
//  03-弹出视图
//
//  Created by qingyun on 15/10/8.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "UIAlertViewController.h"

@interface UIAlertViewController ()<UIAlertViewDelegate>

@end

@implementation UIAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}
- (IBAction)click:(UIButton *)sender {
    //创建一个UIalertView
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"请充值" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    //设置alertView的风格
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    //添加点击button
    NSInteger addButtonIndex = [alertView addButtonWithTitle:@"考虑一下"];
    //根据buttonIndex获取btn的标题
    NSString *btnTitle = [alertView buttonTitleAtIndex:0];
    //显示alertView
    [alertView show];
    
    
    

}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UITextField *firstTextField = [alertView textFieldAtIndex:0];
    UITextField *secondTextField = [alertView textFieldAtIndex:1];
    switch (buttonIndex) {
        case 0://取消
            NSLog(@"取消");
            break;
        case 1://确定
            NSLog(@"确定");
            break;
        case 2://考虑一下
            NSLog(@"考虑一下");
            break;
            
        default:
            break;
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    return NO;
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    NSLog(@"%s",__func__);
}
@end
