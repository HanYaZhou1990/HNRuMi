 //
//  BlockTest.m
//  HNRuMi
//
//  Created by hanyazhou on 15/5/22.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import "BlockTest.h"

@implementation BlockTest

- (void)stringTestBlockCompletion:(NSString *)string
                                     handle:(testBlock)handleBlock{
    
    _myblock = handleBlock;
    _myblock(@{@"key":string},[string componentsSeparatedByString:@"i"],string);
}

@end
