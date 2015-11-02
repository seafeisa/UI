//
//  ViewController.m
//  PickerViewDemo
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYFirstViewController.h"

@interface QYFirstViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation QYFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置最小值
    //创建时间组成部分
    NSDateComponents *components = [[NSDateComponents alloc] init];
    //设置年、月、日
    components.year = 2015;
    components.month = 11;
    components.day = 1;
    
    //获取当前的日历
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *minDate = [calendar dateFromComponents:components];
    
    _datePicker.minimumDate = minDate;
    
    //设置最大值
    
    NSDate *maxDate = [[NSDate alloc] initWithTimeIntervalSinceNow:3 * 24 * 60 * 60];
    _datePicker.maximumDate = maxDate;
    
    _datePicker.timeZone = [NSTimeZone defaultTimeZone];
 
    
    //添加事件监听
    [_datePicker addTarget:self action:@selector(datePickerValueChange:) forControlEvents:UIControlEventValueChanged];
    
}

-(void)datePickerValueChange:(UIDatePicker *)datePicker
{
    NSLog(@"%@",[datePicker.date descriptionWithLocale:datePicker.locale]);
}
- (IBAction)select:(UIButton *)sender {
    
    NSLog(@"%@",[_datePicker.date descriptionWithLocale:_datePicker.locale]);
    NSString *selectedDate = [_datePicker.date descriptionWithLocale:_datePicker.locale];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"你选择的时间是：" message:selectedDate preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:^{
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
