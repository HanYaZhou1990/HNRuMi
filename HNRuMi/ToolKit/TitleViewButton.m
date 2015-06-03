//
//  TitleViewButton.m
//  HNRuMi
//
//  Created by hanyazhou on 15/6/1.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import "TitleViewButton.h"

@implementation TitleViewButton

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        /**打印执行时间
         #import <mach/mach_time.h>
        uint64_t begin = mach_absolute_time();
        uint64_t end = mach_absolute_time();
        NSLog(@"%llu",begin-end);
         */
        self.titleLabel.adjustsFontSizeToFitWidth = YES;
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
        [self addTarget:self action:@selector(titleButtonCliked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)titleButtonCliked:(UIButton *)sender {
    _clicked(self);
}
- (void)buttonCliked:(clickedBlock)handle{
    _clicked = handle;
}

- (void)drawRect:(CGRect)rect{
    if (self.cornerType == TitleViewButtonTypeCorner) {
        CGFloat width = CGRectGetWidth(self.frame);
        CGFloat height = CGRectGetHeight(self.frame);
        
        UIColor *color = [UIColor whiteColor];
        [color set]; //设置线条颜色
        
        UIBezierPath* aPath = [UIBezierPath bezierPath];
        [aPath removeAllPoints];
        if (self.selected) {
            [aPath moveToPoint:CGPointMake(width-15, height/2-6)];/*起始点*/
            [aPath addLineToPoint:CGPointMake(width-21, height/2+6)];
            [aPath addLineToPoint:CGPointMake(width-9, height/2+6)];
        }else{
            [aPath moveToPoint:CGPointMake(width-15, height/2+6)];/*起始点*/
            [aPath addLineToPoint:CGPointMake(width-21, height/2-6)];
            [aPath addLineToPoint:CGPointMake(width-9, height/2-6)];
        }
        [aPath closePath];//第五条线通过调用closePath方法得到的
        
        [aPath fill];//Draws line 根据坐标点连线
    }else{}
}

@end
