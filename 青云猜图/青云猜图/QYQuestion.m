//
//  QYQuestion.m
//  青云猜图
//
//  Created by qingyun on 15/10/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "QYQuestion.h"

@implementation QYQuestion

-(instancetype)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
//        _answer = dict[@"answer"];
//        _icon = dict[@"icon"];
//        _title = dict[@"title"];
//        _options = dict[@"options"];
        
        //使用KVC的方式把字典数据直接灌入数据模型
        [self setValuesForKeysWithDictionary:dict];
        
        _answerCount = _answer.length;
    }
    return self;
}

+(instancetype)questionWtihDictionary:(NSDictionary *)dict
{
    return [[self alloc]initWithDictionary:dict];
}
@end
