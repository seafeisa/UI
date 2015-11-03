//
//  NextViewController.h
//  01-Block块传值
//
//  Created by qingyun on 15/10/26.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class ViewController;
@interface NextViewController : UIViewController

//@property (nonatomic, strong)ViewController *vc;

@property (nonatomic, strong)void (^changeLabelValue)(NSString *text);
@end
