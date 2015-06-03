//
//  BlockTest.h
//  HNRuMi
//
//  Created by hanyazhou on 15/5/22.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^testBlock) (NSDictionary *testdic,NSArray *testArray,NSString *testString);

@interface BlockTest : NSObject

@property (nonatomic, assign) testBlock   myblock;

- (void)stringTestBlockCompletion:(NSString *)string handle:(testBlock)handleBlock;

@end
