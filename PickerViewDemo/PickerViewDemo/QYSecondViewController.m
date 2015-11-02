//
//  QYSecondViewController.m
//  PickerViewDemo
//
//  Created by qingyun on 15/11/2.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYSecondViewController.h"

@interface QYSecondViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;


@property (nonatomic, strong) NSArray *datas;
@end

@implementation QYSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerView.dataSource = self;
    _pickerView.delegate = self;
    
    [self loadDataSource];
    
    _label.text = _datas[0];
    // Do any additional setup after loading the view.
}

-(void)loadDataSource
{
    _datas = @[@"Luke",@"Leia",@"Han",@"Chewbacca",@"Artoo",@"Threepio",@"Lando"];
}

#pragma mark  -UIPickerViewDataSource

//pickerView的列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//每列中行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _datas.count;
}
#pragma mark  -UIPickerViewDelegate

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 60;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
//    if (row == 0) {
//        return nil;
//    }
    return _datas[row];
}


-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (row == 0) {
        
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:_datas[0] attributes:@{NSUnderlineStyleAttributeName:@1,NSForegroundColorAttributeName:[UIColor redColor]}];
        
        return attributedString;
    }
    
    return nil;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _label.text = _datas[row];
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
