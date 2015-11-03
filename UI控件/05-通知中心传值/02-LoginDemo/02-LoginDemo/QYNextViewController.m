//
//  QYNextViewController.m
//  02-LoginDemo
//
//  Created by qingyun on 15/10/17.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYNextViewController.h"

@interface QYNextViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) NSString *text;
@end

@implementation QYNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _textField.text = _text;
    
}
- (IBAction)back:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
        //第一个参数是当前发送的通知的名称，第二个参数是当前的发送者，第三个参数是通知的内容
        [[NSNotificationCenter defaultCenter] postNotificationName:@"changeLabelValue" object:nil userInfo:@{@"value":_textField.text}];
    }];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
