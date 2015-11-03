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
    // Do any additional setup after loading the view.
}
- (IBAction)logout:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //获取目标视图控制器
    UIViewController *dstVC = segue.destinationViewController;
    
    [dstVC setValue:_nextLabel.text forKeyPath:@"text"];
    
    //更改nextLabel的文本
    void (^changeValue)(NSString *value) = ^(NSString *value){
        _nextLabel.text = value;//???????wei
    };
    
    
    //对QYNextViewController的changeLabelValue属性赋值
    [dstVC setValue:changeValue forKeyPath:@"changeLabelValue"];
    
}


@end
