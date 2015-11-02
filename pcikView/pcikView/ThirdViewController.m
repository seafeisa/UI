//
//  ThirdViewController.m
//  pcikView
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 qingyun.com. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickView;
@property (weak, nonatomic) IBOutlet UIView *showView;
@property (nonatomic) CGFloat redNum;
@property (nonatomic) CGFloat greenNum;
@property (nonatomic) CGFloat blueNum;
@end
#define RGBMax 255
#define StepValue 5
#define RowNum RGBMax/StepValue + 1
@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pickView.delegate = self;
    _pickView.dataSource = self;
    
    [self configPickView];
}
-(void)configPickView
{
    [self selectPickerView:_pickView forRow:round(random()%52) inComponent:RGBCompinentTypeRed];
    
    [self selectPickerView:_pickView forRow:round(random()%52) inComponent:RGBCompinentTypeGreen];
    
    [self selectPickerView:_pickView forRow:round(random()%52) inComponent:RGBCompinentTypeBlue];
}


-(void)selectPickerView:(UIPickerView *)pickerView forRow:(NSInteger)row inComponent:(NSInteger)component
{
    [pickerView selectRow:row inComponent:component animated:YES];
    [self pickerView:pickerView didSelectRow:row inComponent:component];
}
#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return RowNum;
}


#pragma mark - UIPickerViewDelegate
-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    CGFloat redColor = 0;
    CGFloat greenColor = 0;
    CGFloat blueColor = 0;
    switch (component) {
        case RGBCompinentTypeRed:
            redColor = row * StepValue/255.0;
            break;
        case RGBCompinentTypeGreen:
           greenColor = row * StepValue/255.0;
            break;
        case RGBCompinentTypeBlue:
            blueColor = row * StepValue/255.0;
            break;
            
        default:
            break;
    }
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%ld",row * StepValue] attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1.0]}];
    return attString;
}




-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    CGFloat value = row * StepValue / 255.0;
    switch (component) {
        case RGBCompinentTypeRed:
            _redNum = value;
            break;
        case RGBCompinentTypeGreen:
            _greenNum = value;
            break;
        case RGBCompinentTypeBlue:
            _blueNum = value;
            break;
            
        default:
            break;
    }
    _showView.backgroundColor = [UIColor colorWithRed:_redNum green:_greenNum blue:_blueNum alpha:1.0];
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 44;
}





















@end
