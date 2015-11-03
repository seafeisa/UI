//
//  QYAnswerView.m
//  青云猜图
//
//  Created by qingyun on 15/10/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYAnswerView.h"
#import "common.h"
@implementation QYAnswerView

+ (instancetype)answerViewWithCount:(NSInteger)count
{
    //初始化一个answerView 作为这个类方法的返回值
    QYAnswerView *answerView = [[self alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 40)];
    
    for (int i = 0; i < count; i++) {
        //answerBtn的间距
        CGFloat space = 10;
        //answerBtn大小
        CGFloat answerBtnW = 40;
        CGFloat answerBtnH = 40;
        
        //计算第一个answerBtn距离屏幕左边的距离
        CGFloat baseX = (QYScreenW - answerBtnW * count - (count - 1) * space)/2;
        
        //计算每一个answerBtn的位置
        CGFloat answerBtnX = baseX + (answerBtnW + space) * i;
        CGFloat answerBtnY = 0;
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(answerBtnX, answerBtnY, answerBtnW, answerBtnH);
        [answerView addSubview:btn];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        
        [btn setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        
        [btn addTarget:answerView action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return answerView;
}

-(void)btnClick:(UIButton *)sender
{
    //_answerBtnAction其实就是视图控制器^(UIButton *btn){}
    //_answerBtnAction = ^(UIButton *btn){};
    if (_answerBtnAction) {
        //使用_answerBtnAction属性，就是使用视图控制器中的^(UIButton *btn){}
        _answerBtnAction(sender);
    }
}
//重写setterFrame方法，重置answerView的位置（大小不变）
-(void)setFrame:(CGRect)frame
{
    /* 
        1、初始化的时候answerView的frame
            self.frame = CGRectMake(0, 0, QYScreenW, 40)
        2、重置的frame
            frame = CGRectMake(0, 350, 0, 0)
        3、最终的frame
            CGRectMake(0, 350, QYScreenW, 40)
     */
    
    CGRect originFrame = self.frame;
    originFrame.origin = frame.origin;
    
    //在setterframe方法中不能使用setterframe方法
    //self.frame = originFrame;
    
    [super setFrame:originFrame];
}

//重写answerBtnIndexs的getter 方法，来确保使用的时候不为nil
-(NSMutableArray *)answerBtnIndexs
{
    if (_answerBtnIndexs == nil) {
        //初始化_answerBtnIndexs数组
        _answerBtnIndexs = [NSMutableArray array];
        for (int i = 0; i < self.subviews.count; i++) {
            //把需要添加的btn的下标添加在 _answerBtnIndexs中
            [_answerBtnIndexs addObject:@(i)];
        }
    }
    return _answerBtnIndexs;
}
@end
