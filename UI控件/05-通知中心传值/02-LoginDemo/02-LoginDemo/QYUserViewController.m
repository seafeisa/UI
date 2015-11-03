//
//  QYUserViewController.m
//  02-LoginDemo
//
//  Created by qingyun on 15/10/17.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYUserViewController.h"

@interface QYUserViewController ()
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *nextLabel;

@end

@implementation QYUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _label.text = [NSString stringWithFormat:@"欢迎您,%@",_userNameString];
    
    //1、首先获取通知中心 [NSNotificationCenter defaultCenter]
    //2、在通知中心中添加通知 addObserver
    
    //第一个参数是通知的响应者（接受者），第二个参数是接受到通知之后所做的操作 ,第三个参数是当前注册的通知的名称， 第四个参数通知的发送者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeNextLabelValue:) name:@"changeLabelValue" object:nil];
    
    // Do any additional setup after loading the view.
}

//更改nextlabelValue
-(void)changeNextLabelValue:(NSNotification *)notification
{
    NSLog(@"%@",notification);
    NSDictionary *dict = notification.userInfo;
    _nextLabel.text = dict[@"value"];
}

//注销
- (IBAction)logout:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        //第一个参数是通知的响应者，第二个参数是通知名称 ，第三个参数是通知发送者
        [[NSNotificationCenter defaultCenter] removeObserver:self name:@"changeLabelValue" object:nil];
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //获取目标视图控制器
    UIViewController *dstVC = segue.destinationViewController;
    
    [dstVC setValue:_nextLabel.text forKeyPath:@"text"];
    
    
}


@end
