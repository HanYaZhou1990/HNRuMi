//
//  YYFatherViewController.m
//  HNRuMi
//
//  Created by hanyazhou on 15/5/19.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import "YYFatherViewController.h"
#import "HYZ+Color.h"
#import "MainViewController.h"

@interface YYFatherViewController ()

@end

/*//        34405e
 //        3f587e
 //        46567e*/
@implementation YYFatherViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationController.navigationBar.translucent = NO;
        [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackOpaque];
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navB.png"] forBarMetrics:UIBarMetricsDefault];
        [[UINavigationBar appearance] setShadowImage:[UIImage initWithColor:[UIColor clearColor]]];
        
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrowback.png"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnClicked)];
    }
    return self;
}

- (void)changeTitleViewTextColor
{
    UIColor *color = UIColorFromRGB(0xf0f0f0);
    UIFont *font = [UIFont fontWithName:ZITI size:20];
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:color,UITextAttributeTextColor,font,UITextAttributeFont, nil];
    self.navigationController.navigationBar.titleTextAttributes = dic;
#else
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName,font,NSFontAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = dic;
#endif    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self changeTitleViewTextColor];
    
    if (IOS7) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    
    UIImage *backImage = [[UIImage imageNamed:@"arrowback.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    /*设置不显示返回按钮的文字*/
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
    
    self.view.backgroundColor = UIColorFromRGB(0xF0F0F0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
