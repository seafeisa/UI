//
//  FirstViewController.m
//  pcikView
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建时间组成部分
    NSDateComponents *components = [[NSDateComponents alloc] init];
    //设置年月日
    components.year = 2015;
    components.month = 11;
    components.day = 2;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *minDate = [calendar dateFromComponents:components];
    //设置最小值
    _datePicker.minimumDate = minDate;
    
    NSDate *maxDate =[[NSDate alloc] initWithTimeIntervalSinceNow:365 * 24 *60*60];
    _datePicker.maximumDate = maxDate;
    
    _datePicker.timeZone= [NSTimeZone defaultTimeZone];
  
}
- (IBAction)Click:(UIButton *)sender {
    NSString *clickDate = [_datePicker.date descriptionWithLocale:_datePicker.locale];
    UIAlertController *AC = [UIAlertController alertControllerWithTitle:@"报时" message:clickDate preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"是" style:0 handler:^(UIAlertAction *action) {
        
    }];
    [AC addAction:action];
    [self presentViewController:AC animated:YES completion:^{
        
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
