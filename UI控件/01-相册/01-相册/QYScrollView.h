//
//  QYScrollView.h
//  01-相册
//
//  Created by qingyun on 15/10/23.
//  Copyright (c) 2015年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYScrollView : UIScrollView

@property (nonatomic, strong) UIImage *img;


-(void)setImage:(UIImage *)image;
@end
