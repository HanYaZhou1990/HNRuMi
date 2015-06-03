//
//  TitleCollectionCell.h
//  HNRuMi
//
//  Created by hanyazhou on 15/5/22.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PublicConfig.h"

/*用来展示应用上边的选择项，可以用图片，可以用文字，支持图文混合(坐标自己修改)
  勿用代码修改两个控件
 */
@interface TitleCollectionCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UIImageView     *titleImageView;
@property (nonatomic, strong) IBOutlet UILabel         *collectiontitleLable;
/*!下边小三角的颜色*/
@property (nonatomic, strong) UIColor   *cornerColor;
@end
