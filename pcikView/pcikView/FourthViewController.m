//
//  FourthViewController.m
//  pcikView
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "FourthViewController.h"
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@interface FourthViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,strong) NSDictionary *dict;
@property (nonatomic,strong) NSArray *keys;
@property (nonatomic,strong) NSArray *values;
@end

@implementation FourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPickerView];
    [self lodaDict];
}


-(void)setPickerView
{
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50,screenW , 150)];
    [self.view addSubview:pickerView];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    _pickerView = pickerView;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(188, 400, 70, 30);
    [self.view addSubview:btn];
    [btn setTitle:@"点" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnClick:(UIButton *)btn
{
    // 在第一列中被选中的行数
    NSInteger leftRow = [_pickerView selectedRowInComponent:0];
    // 在第二列中被选中的行数
    NSInteger rightRow = [_pickerView selectedRowInComponent:1];
    
    NSString *leftString = _keys[leftRow];
    NSString *rightString = _values[rightRow];
    
    // 拼接字符串
    NSString *message = [NSString stringWithFormat:@"%@-%@",leftString,rightString];
    
    UIAlertController *AC = [UIAlertController alertControllerWithTitle:@"显示" message:message preferredStyle:1];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"知道了" style:1 handler:^(UIAlertAction *action) {
        
    }];
    [AC addAction:action1];
    [self presentViewController:AC animated:YES completion:^{
        
    }];
}
-(void)lodaDict
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"statedictionary" ofType:@"plist"];
    _dict = [NSDictionary dictionaryWithContentsOfFile:path];
    _keys = [_dict.allKeys sortedArrayUsingSelector:@selector(compare:)];
    _values = _dict[_keys[0] ];
}
#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return _keys.count;
    }
    return _values.count;
}
#pragma mark - UIPickerViewDelegate

// 给每行赋值
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return _keys[row];
    }
    return _values[row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        NSString *key = _keys[row];
        _values = _dict[key];
        
        // 刷新数据
        [pickerView reloadComponent:1];
        
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}


















@end
