//
//  ViewController.m
//  01-Block块传值
//
//  Created by qingyun on 15/10/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //_abc = @selector(changeLabelText:);
    
    //[self performSelector:_abc withObject:@"hello" afterDelay:1];
    // Do any additional setup after loading the view, typically from a nib.
}

//-(void)changeLabelText:(NSString *)text
//{
//    _label.text = text;
//}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NextViewController *nextVC = (NextViewController *)segue.destinationViewController;
    
    //nextVC.vc = self;
    
    void(^changeLabelValue)(NSString *text) = ^(NSString *text){
        _label.text = text;
    };
    
    nextVC.changeLabelValue = changeLabelValue;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
