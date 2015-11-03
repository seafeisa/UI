//
//  NextViewController.m
//  01-Block块传值
//
//  Created by qingyun on 15/10/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "NextViewController.h"
//#import "ViewController.h"
@interface NextViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        //[_vc performSelector:_vc.abc withObject:_textField.text afterDelay:1];
        //[self performSelector:_abc withObject:_textField.text afterDelay:1];
        
        if (_changeLabelValue) {
            _changeLabelValue(_textField.text);
        }
    }];
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
