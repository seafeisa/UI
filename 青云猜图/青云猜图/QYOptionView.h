//
//  QYOptionView.h
//  青云猜图
//
//  Created by qingyun on 15/10/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYOptionView : UIView

@property (strong, nonatomic)void(^optionBtnAction)(UIButton *btn);

+(instancetype)optionView;
//设置optionView上btn的标题
-(void)setOptionBtnTitle:(NSArray *)options;
@end
