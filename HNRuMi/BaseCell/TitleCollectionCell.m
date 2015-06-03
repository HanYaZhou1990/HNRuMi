//
//  TitleCollectionCell.m
//  HNRuMi
//
//  Created by hanyazhou on 15/5/22.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import "TitleCollectionCell.h"

@interface TitleCollectionCell ()

@end

@implementation TitleCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {        
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"TitleCollectionCell" owner:self options:nil];
        if (views.count < 1) {
            return nil;
        }
        if (![views[0] isKindOfClass:[TitleCollectionCell class]]) {
            return nil;
        }
        self = views[0];
    }
    return self;
}

- (void)awakeFromNib{}

- (void)drawRect:(CGRect)rect{
    CGFloat width = CGRectGetWidth(self.frame);
    
    UIColor *color = _cornerColor;
    [color set]; //设置线条颜色
    
    UIBezierPath* aPath = [UIBezierPath bezierPath];    
    [aPath moveToPoint:CGPointMake(width/2, 36)];/*起始点*/
    [aPath addLineToPoint:CGPointMake(width/2-6, 43.0)];
    [aPath addLineToPoint:CGPointMake(width/2+6, 43.0)];
    [aPath closePath];//第五条线通过调用closePath方法得到的
    
    [aPath fill];//Draws line 根据坐标点连线
}

@end
