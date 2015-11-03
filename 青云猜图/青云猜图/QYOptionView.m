//
//  QYOptionView.m
//  青云猜图
//
//  Created by qingyun on 15/10/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYOptionView.h"

@implementation QYOptionView

//初始化
+(instancetype)optionView
{
    //从xib文件中加载optionView
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"QYOptionView" owner:nil options:nil];
    return array[0];
}

//点击optionBtn
- (void)btnClick:(UIButton *)sender {
    if (_optionBtnAction) {
        _optionBtnAction(sender);
    }
}

//设置optionView上btn的标题
-(void)setOptionBtnTitle:(NSArray *)options
{
    //遍历optionView上的子视图，找到每一个optionBtn
    for (int i = 0; i < options.count; i++) {
        UIButton *btn = (UIButton *)self.subviews[i];
        //对optionBtn进行标题设置
        [btn setTitle:options[i] forState:UIControlStateNormal];
        //对optionBtn添加点击事件
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

//重写setterFrame方法，重置answerView的位置（大小不变）
-(void)setFrame:(CGRect)frame
{
    CGRect originFrame = self.frame;
    originFrame.origin = frame.origin;
    
    [super setFrame:originFrame];
}

@end
