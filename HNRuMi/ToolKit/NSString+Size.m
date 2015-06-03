//
//  NSString+Size.m
//  HNRuMi
//
//  Created by hanyazhou on 15/6/2.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import "NSString+Size.h"
#import <UIKit/UIKit.h>

@implementation NSString (Size)

+ (CGSize)sizeForString:(NSString *)string withFontSize:(CGFloat)textSize andWidth:(CGFloat)width {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    CGSize size = [string sizeWithFont:[UIFont systemFontOfSize:textSize] constrainedToSize:CGSizeMake(wide, CGFLOAT_MAX)];
    return size;
#else
    NSDictionary *attributesDic = @{NSFontAttributeName:[UIFont systemFontOfSize:textSize]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil].size;
    return size;
#endif
}

+ (CGSize)sizeForString:(NSString *)string withFontSize:(CGFloat)textSize andHeight:(CGFloat)height {
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0
    CGSize size = [string sizeWithFont:[UIFont systemFontOfSize:textSize] constrainedToSize:CGSizeMake(CGFLOAT_MAX, height)];
    return size;
#else
    NSDictionary *attributesDic = @{NSFontAttributeName:[UIFont systemFontOfSize:textSize]};
    CGSize size = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributesDic context:nil].size;
    return size;
#endif
}

@end
