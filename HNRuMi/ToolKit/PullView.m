//
//  PullView.m
//  HNRuMi
//
//  Created by hanyazhou on 15/5/30.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import "PullView.h"

@interface PullView ()<UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITapGestureRecognizer *gesture;
@property (nonatomic, strong) UITableView            *titleTableView;

@end

@implementation PullView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor  = [UIColor clearColor];
        
        _titleTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, frame.size.height-10) style:UITableViewStylePlain];
        _titleTableView.dataSource = self;
        _titleTableView.delegate = self;
        _titleTableView.scrollEnabled = NO;
        _titleTableView.tableFooterView = [UIView  new];
        [_titleTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _titleTableView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.7];
        [self addSubview:_titleTableView];
    }
    return self;
}

#pragma mark UITableViewDataSource -
#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = _titleArray[indexPath.row];
    cell.textLabel.textColor = UIColorFromRGB(0xf0f0f0);
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    return cell;
}

#pragma mark UITableViewDelegate -
#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _cellSelected(self,tableView,indexPath);
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    [_titleTableView reloadData];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    _titleTableView.frame = CGRectMake(0, 10, frame.size.width, frame.size.height-10);
}

- (void)drawRect:(CGRect)rect{
    CGFloat width = CGRectGetWidth(self.frame);
    
    UIColor *color = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.8];
    [color set]; //设置线条颜色

    UIBezierPath* aPath = [UIBezierPath bezierPath];
    
    if (_cornerPoint.x == 0 && _cornerPoint.y == 0) {
        [aPath moveToPoint:CGPointMake(width/2, 0)];/*起始点*/
        [aPath addLineToPoint:CGPointMake(width/2-8, 10)];
        [aPath addLineToPoint:CGPointMake(width/2+8, 10)];
    }else {
        [aPath moveToPoint:CGPointMake(_cornerPoint.x, 0)];/*起始点*/
        [aPath addLineToPoint:CGPointMake(_cornerPoint.x-8, 10)];
        [aPath addLineToPoint:CGPointMake(_cornerPoint.x+8, 10)];
    }
    [aPath closePath];//第五条线通过调用closePath方法得到的
    
    [aPath fill];//Draws line 根据坐标点连线
}

- (void)cellCliked:(tableViewCellSelected)handle {
    _cellSelected = handle;
}

@end
