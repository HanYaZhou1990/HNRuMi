//
//  MainMenuView.h
//  HNRuMi
//
//  Created by hanyazhou on 15/5/28.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TitleCollectionCell.h"
#import "HYZ+Color.h"

typedef void(^collectionItemClicked) (UICollectionView *collectionView, NSIndexPath *indexPath);

@interface MainMenuView : UIView<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate>
/*!标题*/
@property (nonatomic, strong) UICollectionView    *mainTitleCollectionView;
/*!标题展示内容,可以使用string也可以使用image  普通 */
@property (nonatomic, strong) NSArray             *titleArray;
/*!默认选择项，如果不设置默认选择第0个
 由于可能出现多个区的情况，那就需要再追加一个区的参数
 这样可以直接省去一个区的参数,增加灵活性
 */
@property (nonatomic, assign) NSIndexPath         *selectedItem;
/*!全局变量，作为回调参数*/
@property (nonatomic, copy) collectionItemClicked clickedBlock;
/*!block回调,如果item被选中会被调用*/
- (void)collectionItemClicked:(collectionItemClicked)handleBlock;

@end

