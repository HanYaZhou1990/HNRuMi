//
//  MainViewController.m
//  HNRuMi
//
//  Created by hanyazhou on 15/5/19.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) PullView          *pullView;
/*放导航上的按钮，解决下拉列表问题*/
@property (nonatomic, strong) NSArray           *buttonArray;
@property (nonatomic, strong) UITableView       *mainTableView;
@property (nonatomic, strong) MainMenuView      *menuView;

@end

@implementation MainViewController

- (void)needHidden:(BOOL)hidden {
    if (hidden == YES) {
        _mainTableView.userInteractionEnabled = YES;
        _menuView.userInteractionEnabled = YES;
    }else{
        _mainTableView.userInteractionEnabled = NO;
        _menuView.userInteractionEnabled = NO;
    }
    _pullView.hidden = hidden;
}

- (void)creatNavigationBarItem{
    TitleViewButton *userItemButton = [TitleViewButton buttonWithType:UIButtonTypeCustom];
    [userItemButton setImage:[UIImage imageNamed:@"moreImageWhite.png"] forState:UIControlStateNormal];
    [userItemButton sizeToFit];
    userItemButton.tag = 20;
    [userItemButton setContentMode:UIViewContentModeCenter];
    userItemButton.cornerType = TitleViewButtonTypeNone;
    [userItemButton addTarget:self action:@selector(mainItemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *userItem = [[UIBarButtonItem alloc] initWithCustomView:userItemButton];
    [userItemButton buttonCliked:^(TitleViewButton *button) {
        [self needHidden:button.selected];
    }];
    
    
    TitleViewButton* publishItemButton = [TitleViewButton buttonWithType:UIButtonTypeCustom];
    [publishItemButton setImage:[UIImage imageNamed:@"publishImageWhite.png"] forState:UIControlStateNormal];
    [publishItemButton sizeToFit];
    publishItemButton.tag = 21;
    publishItemButton.cornerType = TitleViewButtonTypeNone;
    [publishItemButton setContentMode:UIViewContentModeCenter];
    [publishItemButton addTarget:self action:@selector(mainItemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *publishItem = [[UIBarButtonItem alloc] initWithCustomView:publishItemButton];
    [publishItemButton buttonCliked:^(TitleViewButton *button) {
        [self needHidden:button.selected];
    }];
    
    
    self.navigationItem.rightBarButtonItems = @[userItem,publishItem];
    
    UIBarButtonItem *calenderItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"calenderImageWhite.png"] style:UIBarButtonItemStylePlain target:self action:@selector(calenderItemClicked:)];
    self.navigationItem.leftBarButtonItem = calenderItem;
    
    TitleViewButton *titleViewButton = [TitleViewButton buttonWithType:UIButtonTypeCustom];
    titleViewButton.frame = CGRectMake(0, 0, MAINWIDTH/3, 44);
    titleViewButton.tag = 22;
    [titleViewButton addTarget:self action:@selector(mainItemBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [titleViewButton setTitle:@"我的群组" forState:UIControlStateNormal];
    self.navigationItem.titleView =titleViewButton;
    [titleViewButton buttonCliked:^(TitleViewButton *button) {
        [self needHidden:button.selected];
        
    }];
    
    _buttonArray = @[userItemButton,publishItemButton,titleViewButton];
}

- (void)mainItemBtnClick:(UIButton *)sender {
    for (TitleViewButton *button in _buttonArray) {
        if (button.tag == sender.tag) {
            sender.selected =! sender.selected;
        }else{
            button.selected = NO;
        }
    }
    switch (sender.tag) {
        case 20:
        {
        _pullView.titleArray = @[@"发布心情",@"上传图片",@"发起投票",@"活动行程"];
        _pullView.frame = CGRectMake(MAINWIDTH-MAINWIDTH/3, 0, MAINWIDTH/3-10, 186);
        _pullView.cornerPoint = CGPointMake(96, 0);
        [_pullView setNeedsDisplay];
        }
            break;
        case 21:
        {
        _pullView.titleArray = @[@"个人资料",@"添加查找",@"批量管理",@"偏好设置"];
        _pullView.frame = CGRectMake(MAINWIDTH-MAINWIDTH/3, 0, MAINWIDTH/3-10, 186);
        _pullView.cornerPoint = CGPointMake(60, 0);
        [_pullView setNeedsDisplay];
        }
            break;

        case 22:{
            _pullView.titleArray = @[@"我的好友",@"我的群组",@"关注的人",@"关注的群"];
            _pullView.frame = CGRectMake(MAINWIDTH/2-MAINWIDTH/3/2, 0, MAINWIDTH/3, 186);
            _pullView.cornerPoint = CGPointMake(0, 0);
            [_pullView setNeedsDisplay];
        }
            break;
            
        default:
            break;
    }
}

- (void)calenderItemClicked:(UIBarButtonItem *)item {
    for (TitleViewButton *button in _buttonArray) {
        button.selected = NO;
        _pullView.hidden = YES;
        _mainTableView.userInteractionEnabled = YES;
        _menuView.userInteractionEnabled = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, MAINWIDTH, MAINHEIGHT-44-NAVIGATION_HEIGHT) style:UITableViewStylePlain];
    _mainTableView.delegate = self;
    _mainTableView.dataSource = self;
    [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_mainTableView];

    [self creatNavigationBarItem];
    
    /*
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd  HH : mm"];
    NSDate* date = [formatter dateFromString:@"2015-05-08  15 : 08"];
    NSString* timesTamp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    NSLog(@"%@",timesTamp);
    */
    
    _menuView = [[MainMenuView alloc] initWithFrame:CGRectMake(0, 0, MAINWIDTH, 44)];
    _menuView.titleArray = @[[UIImage imageNamed:@"chatBar.png"],[UIImage imageNamed:@"friendBar.png"],[UIImage imageNamed:@"publishBar.png"]];
    _menuView.selectedItem = [NSIndexPath indexPathForItem:1 inSection:0];
    /*如果选项比较靠后，首页展示不出来，需要滑动才能出来，需要调用次方法
     
    [menuView.mainTitleCollectionView scrollToItemAtIndexPath:menuView.selectedItem atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
     */
    [self.view addSubview:_menuView];
    
    [MBProgressHUD showHUDAddedToExt:self.view showMessage:@"加载中..." animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC*1.0), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    });
    
    [_menuView collectionItemClicked:^(UICollectionView *collectionView, NSIndexPath *indexPath) {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _menuView.selectedItem = indexPath;
        NSLog(@"*******%ld*/**********",indexPath.row);
    }];
        
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"com.henan.rumi"];
    NSLog(@"%@",dic);
    
    NSLog(@"手机系统版本%@",[[UIDevice currentDevice] systemVersion]);
    
    _pullView = [[PullView alloc] initWithFrame:CGRectMake(0, 0, 96, 186)];
    _pullView.hidden = YES;
    [self.view addSubview:_pullView];
    
    [_pullView cellCliked:^(UIView *view, UITableView *tableView, NSIndexPath *indexPath) {
        [self reloadAll];        
    }];
}
#pragma mark -
#pragma mark UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
#pragma mark -
#pragma mark UITableViewDelegate -

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self reloadAll];
}

- (void)reloadAll {
    [self needHidden:YES];
    for (TitleViewButton *button in _buttonArray) {
        button.selected = NO;
        _pullView.hidden = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
