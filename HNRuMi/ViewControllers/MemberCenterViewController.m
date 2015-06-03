//
//  MemberCenterViewController.m
//  HNRuMi
//
//  Created by hanyazhou on 15/5/19.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import "MemberCenterViewController.h"

typedef int (^mySum)(int,int);

@interface MemberCenterViewController ()

@end

@implementation MemberCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MemberCenter";
    
    
    /*声明block变量*/
    /*sum是block变量，该block类型有两个int类型参数，返回类型是int */
    int(^sum)(int, int) = nil;
    /*定义block病赋值给变量sum*/
    sum = ^int(int a, int b){
        return a + b;
    };
    /*调用block*/
    int c = sum(1,5);
    
    NSLog(@"%d",c);
    
    /*调用block函数*/
    int d =[self sumBlock](3,7);
    printf("%d",d);
    
    /*调用block函数*/
    int e = [self sumBlockTest](4,1);
    NSLog(@"%d",e);
    BlockTest *bt = [[BlockTest alloc] init];
    [bt stringTestBlockCompletion:@"This is block test ! " handle:^(NSDictionary *testdic, NSArray *testArray, NSString *testString) {
        NSLog(@"testdic:%@",testdic);
        NSLog(@"testArray:%@",testArray);
        NSLog(@"testString:%@",testString);
    }];
}

/*定义一个block函数*/
- (int(^)(int,int))sumBlock {
    int base = 100;
    return ^int(int a, int b){
        return base + a + b;
    };
}
/*通过 typedef 定义一个block函数*/
- (mySum)sumBlockTest{
    int base = 789;
    mySum sum = ^int(int a, int b){
        return base + a + b;
    };
    return sum;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
