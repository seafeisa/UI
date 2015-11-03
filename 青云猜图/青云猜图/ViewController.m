//
//  ViewController.m
//  青云猜图
//
//  Created by qingyun on 15/10/12.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYQuestion.h"
#import "QYAnswerView.h"
#import "QYOptionView.h"
#import "common.h"
@interface ViewController ()
{
    NSInteger index;//每一题的下标（在点击下一题的时候使用）
}
@property(nonatomic, strong)NSArray *questions;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *coinBtn;

@property (strong, nonatomic)QYAnswerView *answerView;
@property (strong, nonatomic)QYOptionView *optionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化初始界面
    [self updateQuestion];
    // Do any additional setup after loading the view, typically from a nib.
}

//懒加载数据
-(NSArray *)questions
{
    if (_questions == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            QYQuestion *question = [QYQuestion questionWtihDictionary:dict];
            [temp addObject:question];
        }
        _questions = temp;
    }
    return _questions;
}

//界面按钮的点击事件
- (IBAction)btnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1://提示
            [self hint:sender];
            break;
        case 2://大图
            [self big:sender];
            break;
        case 3://帮助
            
            break;
        case 4://下一题
            [self next];
            break;
            
        default:
            break;
    }
    
}
#pragma mark - 更新界面
//更新界面
-(void)updateQuestion
{
    if (index > self.questions.count - 1) {
        index = 0;
    }
    //更新界面
    QYQuestion *question = (QYQuestion *)self.questions[index];
    
    if (question.isFinish) {
        [self next];
        return;
    }
    
    //1、更改numLabel
    _numLabel.text = [NSString stringWithFormat:@"%ld/%lu",index + 1,self.questions.count];
    //2、更改titleLabel
    _titleLabel.text = question.title;
    
    //3、更改imageView
    _imageView.image = [UIImage imageNamed:question.icon];
    
    //添加answerView
    [_answerView removeFromSuperview];
    
    QYAnswerView *answerView = [QYAnswerView answerViewWithCount:question.answerCount];
    [self.view addSubview:answerView];
    answerView.frame = CGRectMake(0, 350, 0, 0);
    _answerView = answerView;
    //_answerView.backgroundColor = [UIColor redColor];
    //void(^answerBtnAction)(UIButton *btn)
    
    //对_answerView的answerBtnAction属性进行赋值
    __weak ViewController *weakSelf = self;
    _answerView.answerBtnAction = ^(UIButton *btn){
        [weakSelf answerBtnClick:btn];
    };
    
    
    //添加optionView
    [_optionView removeFromSuperview];
    //创建一个optionView
    QYOptionView *optionView = [QYOptionView optionView];
    [self.view addSubview:optionView];
    //重置optionView的位置
    optionView.frame = CGRectMake(0, 430, 0, 0);
    //设置optionView上btn的标题
    [optionView setOptionBtnTitle:question.options];
    
    _optionView = optionView;
    optionView.optionBtnAction = ^(UIButton *btn){
        [weakSelf optionBtnClick:btn isHint:NO];
    };
    
}

#pragma mark - 1、下一题，2、提示
//下一题
-(void)next
{
    //定义一个bool变量来表示是否通关
    BOOL isPass = YES;
    //寻找是否有未做过的题目
    for (QYQuestion *question in self.questions) {
        if (!question.isFinish) {
            isPass = NO;
            break;
        }
    }
    //通关
    if (isPass) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提醒" message:@"恭喜你，通关了，是否再来一次" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
        
        [alertController addAction:noAction];
        
        UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            for (QYQuestion *question in self.questions) {
                //表示题目未做过
                question.isFinish = NO;
            }
            //更新界面
            [self next];
        }];
        [alertController addAction:yesAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }
    
    index++;
    [self updateQuestion];
}

//提示
-(void)hint:(UIButton *)sender
{
    //判断当前金币是否不小于将要花费的金币
    if ([_coinBtn.currentTitle integerValue] < 1000) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提醒" message:@"金币不足，请充值，推荐使用青云支付，尊享8折优惠" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}];
        
        [alertController addAction:noAction];
        
        UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
            [self changeCoin:10000];
        }];
        [alertController addAction:yesAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        return;
    }
    
    //获取当前题目对应的的正确答案
    QYQuestion *question = self.questions[index];
    
    //提取当前需要填写的answerBtn的标题
    
    NSNumber *index1 = _answerView.answerBtnIndexs.firstObject;
    
    if (index1 != nil) {
        NSInteger rangeIndex = [index1 integerValue];
        
        NSString *answerBtnTitle = [question.answer substringWithRange:NSMakeRange(rangeIndex, 1)];
        
        //用answerBtn的标题，找到optionview中相对应的optionBtn，并且 模拟点击optionBtn
        
        for (UIButton *optionBtn in _optionView.subviews) {
            //找到optionview中相对应的optionBtn
            if ([optionBtn.currentTitle isEqualToString:answerBtnTitle] && !optionBtn.hidden) {
                //模拟点击optionBtn
                [self optionBtnClick:optionBtn isHint:YES];
                //金币减少1000
                [self changeCoin:-1000];
                break;
            }
        }
    }
    
}

#pragma mark - answerBtn和optionBtn点击触发的事件
//点击answerBtn具体实现的功能
-(void)answerBtnClick:(UIButton *)answerBtn
{
    if (answerBtn.currentTitle == nil) return;
    
    //显示optionView上相对应的btn
    
    UIButton *optionBtn = (UIButton *)[_optionView viewWithTag:answerBtn.tag];
    optionBtn.hidden = NO;
    
    optionBtn.tag = answerBtn.tag = 0;
    
    //清除btn的标题
    [answerBtn setTitle:nil forState:UIControlStateNormal];
    
    [self changeAnswerBtnTitleColor:[UIColor blackColor]];
    
    //获取当前的answerBtn的index
    NSInteger answerBtnIndex = [_answerView.subviews indexOfObject:answerBtn];
    
    //⚠⚠⚠ 把answerBtnIndex添加answerBtnIndexs中，确保answerBtnIndexs中的下标与界面为填写的btn的下标一致
    [_answerView.answerBtnIndexs addObject:@(answerBtnIndex)];
    
    //对answerBtnIndexs数组进行排序，确保填写answerbtnTitle的时候是从左至右的
    NSArray *array = [_answerView.answerBtnIndexs sortedArrayUsingSelector:@selector(compare:)];
    _answerView.answerBtnIndexs = [NSMutableArray arrayWithArray:array];
}

//点击optionBtn具体实现的功能
-(void)optionBtnClick:(UIButton *)optionBtn isHint:(BOOL)hint
{
    if (_answerView.answerBtnIndexs.count > 0) {
        //隐藏optionBtn
        optionBtn.hidden = YES;
        
        //从需要填写的answerBtnIndexs数组中找到第一个需要填写的下标值
        NSInteger answerBtnIndex = [_answerView.answerBtnIndexs.firstObject integerValue];
        //拿下标值从_answerView.subviews中取出相对应的answerBtn
        UIButton *answerBtn = (UIButton *)_answerView.subviews[answerBtnIndex];
        
        //把optionBtn的标题填写到相应的answerBtn上
        [answerBtn setTitle:optionBtn.currentTitle forState:UIControlStateNormal];
        
        //⚠⚠⚠ 把answerBtnIndex从answerBtnIndexs中移除，确保answerBtnIndexs中的下标与界面为填写的btn的下标一致
        [_answerView.answerBtnIndexs removeObjectAtIndex:0];
        
        //把optionBtn和answerBtn的tag值设置一致，以便后面 用其中一个btn找到另外一个
        optionBtn.tag = answerBtn.tag = answerBtnIndex + 100;
    }
    
    if (_answerView.answerBtnIndexs.count == 0){
        //判断是否填充完毕（把answerView上的btn全填写）
        NSMutableString *answerString = [NSMutableString string];
        for (UIButton *btn in _answerView.subviews) {
            //把当前的btn的标题追加到answerString上
            [answerString appendString:btn.currentTitle];
        }
        
        //当前题目对应的question
        QYQuestion *question = self.questions[index];
        //判断是否正确
        if ([question.answer isEqualToString:answerString]) {//正确
            //正确，字体变绿 加金币 下一题
            [self changeAnswerBtnTitleColor:[UIColor greenColor]];
            
            if (!hint) {
                [self changeCoin:1000];
            }
            
            [self performSelector:@selector(next) withObject:nil afterDelay:1];
            
            //标记当前题目已完成
            question.isFinish = YES;
            
        }else{//错误
            //字体变红
            [self changeAnswerBtnTitleColor:[UIColor redColor]];
        }
    }
}

#pragma mark - 1、金币加减，2、更改answerBtn的标题颜色，3、缩小放大imageView
//加减金币
-(void)changeCoin:(NSInteger)num
{
    //获取当前的coin的标题
    NSString *currentTitle = _coinBtn.currentTitle;
    NSInteger s = [currentTitle integerValue] + num;
    NSString *title = [NSString stringWithFormat:@"%ld",(long)s];
    //更改标题
    [_coinBtn setTitle:title forState:UIControlStateNormal];
}

//更改answerBtn的标题颜色
-(void)changeAnswerBtnTitleColor:(UIColor *)color
{
    for (UIButton *btn in _answerView.subviews) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
}

//缩小imageView
-(void)small:(UIButton *)sender
{
    [UIView animateWithDuration:1 animations:^{
        _imageView.transform = CGAffineTransformIdentity;
        sender.alpha = 0;
    } completion:^(BOOL finished) {
        [sender removeFromSuperview];
    }];
}
//放大imageView
-(void)big:(UIButton *)sender
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = self.view.frame;
    btn.backgroundColor = [UIColor orangeColor];
    btn.alpha = 0;
    // 对btn添加点击事件，缩小imageview
    [btn addTarget:self action:@selector(small:) forControlEvents:UIControlEventTouchUpInside];
    //把imageView置顶
    [self.view bringSubviewToFront:_imageView];
    
    [UIView animateWithDuration:1 animations:^{
        _imageView.transform = CGAffineTransformScale(_imageView.transform, 1.5, 1.5);
        btn.alpha = 0.6;
    }];
}

@end
