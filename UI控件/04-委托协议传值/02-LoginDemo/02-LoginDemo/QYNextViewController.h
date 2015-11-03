//
//  QYNextViewController.h
//  02-LoginDemo
//
//  Created by qingyun on 15/10/17.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYChangeLabelValue.h"
@interface QYNextViewController : UIViewController

@property (nonatomic,assign) id <QYChangeLabelValue> delegate;
@end
