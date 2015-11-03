//
//  ViewController.m
//  03-弹出视图
//
//  Created by qingyun on 15/10/8.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取当前设备的系统版本
    [[UIDevice currentDevice]systemVersion];
    // Do any additional setup after loading the view.
}
- (IBAction)click:(UIButton *)sender {
    
    // 创建一个UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提醒" message:@"余额不足，请充值，使用青云支付，尊享8折优惠" preferredStyle:UIAlertControllerStyleActionSheet];
    
    //创建UIAlertAction
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"立即使用" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        NSLog(@"立即使用");
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"马上支付" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"马上支付");
    }];
    //添加action1到alertController
    [alertController addAction:action1];
    [alertController addAction:action2];
#if 0
    //添加textField
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入用户名";
    }];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入密码";
        textField.secureTextEntry = YES;
    }];
#endif
    
    // 使用模态的方式，显示alertController
    [self presentViewController:alertController animated:YES completion:^{}];
    
    NSArray *actions = alertController.actions;
    UIAlertAction *ac = (UIAlertAction *)actions.firstObject;
    NSString *acTitle = ac.title;
    
    NSArray *textFields = alertController.textFields;
    UITextField *tf = (UITextField *)textFields.firstObject;
    NSString *tfPlaceHolder = tf.placeholder;
    
}



@end
