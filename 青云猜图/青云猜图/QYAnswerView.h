//
//  QYAnswerView.h
//  青云猜图
//
//  Created by qingyun on 15/10/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYAnswerView : UIView
//声明answerBtnAction为QYAnswerView的一个属性
@property(strong, nonatomic)void(^answerBtnAction)(UIButton *btn);
//声明一个answerBtnIndexs,存放的是未填写的answerView的btn的下标
@property(strong, nonatomic)NSMutableArray *answerBtnIndexs;

//声明QYAnswerView初始化方法
+ (instancetype)answerViewWithCount:(NSInteger)count;
@end
