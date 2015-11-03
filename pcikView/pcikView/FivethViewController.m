//
//  FivethViewController.m
//  pcikView
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "FivethViewController.h"
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

@interface FivethViewController ()<UIPickerViewDataSource,UIPickerViewDelegate,UIPickerViewAccessibilityDelegate>
@property (nonatomic,strong) NSArray *datas;
@property (nonatomic,strong) UIPickerView *pickView;
@property (nonatomic,strong) UILabel *lable;
@property (nonatomic )NSInteger hardLevel;
@end

@implementation FivethViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setPickerView];
    _hardLevel = 5;
    
}
-(void)setPickerView
{
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50,screenW , 150)];
    [self.view addSubview:pickerView];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    _pickView = pickerView;
    
    _datas = @[@"apple",@"bar",@"cherry",@"crown",@"lemon",@"seven"];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(150, 400, 75, 40);
    [self.view addSubview:btn];
    [btn setTitle:@"摇一摇" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(130, 300, 100, 40)];
    [self.view addSubview:lable];
    _lable = lable;
}
-(void)btnClick:(UIButton *)btn
{
    _lable.text = @"";
    NSInteger numOfRowContinous = 1;
    NSInteger compareRow = 0;
    BOOL isWin = NO;
    
    for (int i = 0; i < 5; i ++) {
        NSInteger selectedRow = round(random()%_datas.count);
        [_pickView selectRow:selectedRow inComponent:i animated:YES];
        
        if (i == 0) {
            compareRow = selectedRow;
            numOfRowContinous = 1;
        }else{
            if (compareRow == selectedRow) {
                numOfRowContinous ++;
            }
            compareRow = selectedRow;
        }
        if (numOfRowContinous >= _hardLevel) {
            isWin = YES;
        }
    }
    if (isWin) {
        _lable.text = @"赢了";
    }
    

}


#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 6;
}
#pragma mark - UIPickerViewDelegate
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImageView *imageView = [[UIImageView alloc] init];
    NSString *imageName = [NSString stringWithString:_datas[row]];
    imageView.image = [UIImage imageNamed:imageName];
    return imageView;
    
}
-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return 70;
}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}


@end
