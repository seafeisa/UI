//
//  SecondViewController.m
//  pcikView
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (nonatomic,strong) NSArray *datas;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    _datas = @[@"大脸猫",@"蓝皮鼠",@"苏克",@"贝塔",@"黑猫警长",@"阿凡提",@"阿里巴巴",@"赖皮蛇"];
    _lable.text = _datas[0];
}

//-(void)loadDataSource
//{
//    _datas = @[@"大脸猫",@"蓝皮鼠",@"苏克",@"贝塔",@"黑猫警长",@"阿凡提",@"阿里巴巴",@"赖皮蛇"];
//}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _datas.count;
}



-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 80;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        return nil;
    }
    return _datas[row];
}

-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:_datas[0] attributes:@{NSBackgroundColorAttributeName:[UIColor blueColor],NSForegroundColorAttributeName:[UIColor blackColor],NSUnderlineStyleAttributeName:@1,NSKernAttributeName:@20}];
        return attributedString;
    }
    return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _lable.text = _datas[row];
}






















@end
