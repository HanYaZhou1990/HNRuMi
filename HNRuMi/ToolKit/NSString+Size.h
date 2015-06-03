//
//  NSString+Size.h
//  HNRuMi
//
//  Created by hanyazhou on 15/6/2.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)
/*!
 函数描述 : 根据文本需要放置的视图的宽度，字体大小，和字符串计算出文本放置的视图的最低高度
 输入参数 : NSString *)string  字符串
          (CGFloat)textSize   文字大小
          (CGFloat)width      视图宽度
 返回参数 : (CGSize)取size的宽度使用
 备注信息 : 适用广泛
 函数名称 : + (CGSize)sizeForString:(NSString *)string withFontSize:(CGFloat)textSize andWidth:(CGFloat)width
*/
+ (CGSize)sizeForString:(NSString *)string withFontSize:(CGFloat)textSize andWidth:(CGFloat)width;
/*!
 函数描述 : 根据文本需要放置的视图的宽度，字体大小，和字符串计算出文本放置的视图的最低高度
 输入参数 : NSString *)string   字符串
          (CGFloat)textSize    文字大小
          (CGFloat)height      视图宽度
 返回参数 : (CGSize)取size的宽度使用
 备注信息 : 适用广泛
 函数名称 : + (CGSize)sizeForString:(NSString *)string withFontSize:(CGFloat)textSize andHeight:(CGFloat)height
 */
+ (CGSize)sizeForString:(NSString *)string withFontSize:(CGFloat)textSize andHeight:(CGFloat)height;

@end
