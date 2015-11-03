//
//  QYQuestion.h
//  青云猜图
//
//  Created by qingyun on 15/10/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYQuestion : NSObject

@property (strong, nonatomic)NSString *answer;  //答案
@property (strong, nonatomic)NSString *icon;    //图片的名称
@property (strong, nonatomic)NSString *title;   //标题
@property (strong, nonatomic)NSArray *options;  //题目对应的选项

//题目答案的长度
@property (nonatomic)NSInteger answerCount;
//当前题目的回答状态
@property (nonatomic)BOOL isFinish;

//初始化方法
-(instancetype)initWithDictionary:(NSDictionary *)dict;
+(instancetype)questionWtihDictionary:(NSDictionary *)dict;
@end
