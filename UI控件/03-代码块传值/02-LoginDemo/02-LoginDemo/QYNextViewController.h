//
//  QYNextViewController.h
//  02-LoginDemo
//
//  Created by qingyun on 15/10/17.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYNextViewController : UIViewController

@property (strong, nonatomic) void (^changeLabelValue)(NSString *);
@end
