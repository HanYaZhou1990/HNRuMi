//
//  PullView.h
//  HNRuMi
//
//  Created by hanyazhou on 15/5/30.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicConfig.h"
#import "NSString+Size.h"

typedef void(^tableViewCellSelected) (UIView *view, UITableView *tableView, NSIndexPath *indexPath);

@interface PullView : UIView

/*!下拉菜单的标题*/
@property (nonatomic, strong) NSArray                *titleArray;
/*!上边小三角的的上角位置位置*/
@property (nonatomic, assign) CGPoint                cornerPoint;
/*!实例变量回调block*/
@property (nonatomic, copy) tableViewCellSelected    cellSelected;

- (void)cellCliked:(tableViewCellSelected)handle;

@end
