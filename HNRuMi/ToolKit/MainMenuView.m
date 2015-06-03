//
//  MainMenuView.m
//  HNRuMi
//
//  Created by hanyazhou on 15/5/28.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import "MainMenuView.h"

@implementation MainMenuView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = UIColorFromRGB(0xf0f0f0);
        
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        self.mainTitleCollectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0,1,MAINWIDTH ,frame.size.height-1) collectionViewLayout:flowLayout];
        
        _mainTitleCollectionView.delegate=self;
        _mainTitleCollectionView.dataSource=self;
        _mainTitleCollectionView.showsHorizontalScrollIndicator=NO;
        _mainTitleCollectionView.backgroundColor = UIColorFromRGB(0xf0f0f0);
        _mainTitleCollectionView.allowsMultipleSelection = NO;
        
        [self addSubview:_mainTitleCollectionView];
        
        [_mainTitleCollectionView registerClass:[TitleCollectionCell class] forCellWithReuseIdentifier:@"titleCell"];
    }
    return self;
}

#pragma mark---顶部的滑动试图
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titleArray.count;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger numberOfCell = [collectionView numberOfItemsInSection:0];
    for (NSInteger i = 0; i < numberOfCell; i ++) {
        NSIndexPath *cellIndexPath = [NSIndexPath indexPathForItem:i inSection:0];
        TitleCollectionCell *cell = (TitleCollectionCell *)[collectionView cellForItemAtIndexPath:cellIndexPath];
        if (cellIndexPath == indexPath) {
            cell.backgroundColor = UIColorFromRGB(0xFFAB48);
            cell.cornerColor = UIColorFromRGB(0xf0f0f0);
            _clickedBlock(collectionView,indexPath);
        }else{
            cell.backgroundColor = UIColorFromRGB(0x46567e);
            cell.cornerColor = UIColorFromRGB(0x46567e);
        }
    }
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TitleCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"titleCell"forIndexPath:indexPath];
    cell.backgroundColor = UIColorFromRGB(0x46567e);
    if ([_titleArray[indexPath.row] isKindOfClass:[NSString class]]) {
        cell.titleImageView.frame = CGRectZero;
        cell.collectiontitleLable.frame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height-1);
        cell.collectiontitleLable.text = _titleArray[indexPath.row];
        cell.collectiontitleLable.textColor = [UIColor whiteColor];
        cell.collectiontitleLable.adjustsFontSizeToFitWidth = YES;
        cell.collectiontitleLable.font = RMFont(26);
        cell.collectiontitleLable.textAlignment = NSTextAlignmentCenter;
    }else{
        cell.collectiontitleLable.frame = CGRectZero;
        cell.titleImageView.frame = CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height-1);
        cell.titleImageView.contentMode = UIViewContentModeScaleAspectFit;
        cell.titleImageView.image = _titleArray[indexPath.row];
    }
    if (indexPath.row == self.selectedItem.row) {
        cell.backgroundColor = UIColorFromRGB(0xFFAB48);
        cell.cornerColor = UIColorFromRGB(0xf0f0f0);
    }else{
        cell.cornerColor = UIColorFromRGB(0x46567e);
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_titleArray.count < 4) {
        return CGSizeMake(MAINWIDTH/_titleArray.count, self.frame.size.height-1);
    }else{
        return CGSizeMake(120, self.frame.size.height-1);
    }
}

- (void)collectionItemClicked:(collectionItemClicked)handleBlock{
    _clickedBlock = handleBlock;
}

@end
