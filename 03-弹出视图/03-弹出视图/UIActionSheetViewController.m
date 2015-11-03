//
//  UIActionSheetViewController.m
//  03-弹出视图
//
//  Created by qingyun on 15/10/8.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "UIActionSheetViewController.h"

@interface UIActionSheetViewController ()<UIActionSheetDelegate>
@property (nonatomic, strong)UIActionSheet *action;
@end

@implementation UIActionSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)click:(UIButton *)sender {
    
    //创建一个UIActionSheet
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"提醒" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:@"考虑一下",@"立即前往", nil];
    
    //设置风格
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    
    //添加点击按钮
    //NSInteger btnIndex = [actionSheet addButtonWithTitle:@"立即前往"];
    
    NSString *firstBtnTitle = [actionSheet buttonTitleAtIndex:0];
    NSString *secondBtnTitle = [actionSheet buttonTitleAtIndex:1];
    NSString *thirdBtnTitle = [actionSheet buttonTitleAtIndex:2];
    
    //显示actionSheet
    [actionSheet showInView:self.view];
    
    _action = actionSheet;
    
    //[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(clickActionSheetBtn) userInfo:nil repeats:NO];
}

-(void)clickActionSheetBtn
{
    [_action dismissWithClickedButtonIndex:3 animated:YES];
}

#pragma mark - UIActionSheetDelegate
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    NSLog(@"%@",title);
    switch (buttonIndex) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
            
        default:
            break;
    }
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    NSLog(@"%s",__func__);
}

@end
