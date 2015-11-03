//
//  QYStoryBoardSegue.m
//  02-LoginDemo
//
//  Created by qingyun on 15/10/17.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYStoryBoardSegue.h"

@implementation QYStoryBoardSegue

-(void)perform
{
    if ([self.identifier isEqualToString:@"login"]) {
        //源视图控制器
        UIViewController *sourceVC = self.sourceViewController;
        //目标视图控制器
        UIViewController *dstVC = self.destinationViewController;
        
        
        //获取用户名和密码
        NSString *userNameString = [sourceVC valueForKeyPath:@"userName.text"];
        NSString *passWordString = [sourceVC valueForKeyPath:@"passWord.text"];
        //判断用户名和密码是否为空
        if ([userNameString isEqualToString:@""] || [passWordString isEqualToString:@""]) {
            [self showAlertView:@"用户名和密码不能为空"];
            return;
        }
        //判断用户名和密码是否正确
        if (![userNameString isEqualToString:@"1"] || ![passWordString isEqualToString:@"q"]) {
            [self showAlertView:@"用户名或密码错误,请重新输入"];
            return;
        }
        
        //登录成功
        [dstVC setValue:userNameString forKeyPath:@"userNameString"];
        
        [sourceVC presentViewController:dstVC animated:YES completion:^{
            [sourceVC setValue:@"" forKeyPath:@"userName.text"];
            [sourceVC setValue:@"" forKeyPath:@"passWord.text"];
        }];
    }else if ([self.identifier isEqualToString:@"register"]){
        //源视图控制器
        UIViewController *sourceVC = self.sourceViewController;
        //目标视图控制器
        UIViewController *dstVC = self.destinationViewController;
        [sourceVC presentViewController:dstVC animated:YES completion:^{
            
        }];
    }
    
}

-(void)showAlertView:(NSString *)msg
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alertView show];
}
@end