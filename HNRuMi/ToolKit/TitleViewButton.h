//
//  TitleViewButton.h
//  HNRuMi
//
//  Created by hanyazhou on 15/6/1.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    TitleViewButtonTypeCorner,
    TitleViewButtonTypeNone
    
}TitleViewButtonType;

@class TitleViewButton;

typedef void (^clickedBlock)(TitleViewButton* button);

@interface TitleViewButton : UIButton
/*文字后边是否有小三角*/
@property (nonatomic, assign) TitleViewButtonType   cornerType;

@property (nonatomic, copy) clickedBlock   clicked;

- (void)buttonCliked:(clickedBlock)handle;

@end
