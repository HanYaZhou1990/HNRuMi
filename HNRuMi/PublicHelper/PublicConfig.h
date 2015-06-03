//
//  PublicConfig.h
//  HNRuMi
//
//  Created by hanyazhou on 15/5/19.
//  Copyright (c) 2015年 HYZ. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef RuMi_RMDefine_h
#define RuMi_RMDefine_h

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define MAINHEIGHT               [[UIScreen mainScreen] bounds].size.height
#define MAINWIDTH                [[UIScreen mainScreen] bounds].size.width
#define NAVIGATION_HEIGHT        64
#define TABBAR_HEIGHT            49
//通过tablename取登录用户的id
#define TABLE_NAME               @"UserInformation"


#endif
//判断设备系统版本使用，以iOS7为分界线
#define IOS7   ([[[UIDevice currentDevice]systemVersion]floatValue]>=7?YES:NO)
#define IOS8   ([[[UIDevice currentDevice]systemVersion]floatValue]>=8?YES:NO)
//字体
#define ZITI                     @"Apple SD Gothic Neo"
#define RMFont(s)                [UIFont fontWithName:ZITI size:s];
//字体颜色   最黑色3d3d3d     白色 F0F0F0
//URL
//#define HTTP_URL                 @"http://192.168.0.254/testmap/sys/web/"
//#define HTTP_URL                 @"http://192.168.1.1/testmap/sys/web/"

#if TARGET_IPHONE_SIMULATOR
#define HTTP_URL                 @"http://192.168.1.1/testmap/sys/web/"
#elif TARGET_OS_IPHONE
#define HTTP_URL                 @"http://server.rumi001.com/"
#endif


//#define HTTP_URL                 @"http://192.168.1.107/"
//#define HTTP_URL                 @"http://server.rumi001.com/"
//自定义一个设置颜色的方法，可以根据十六进制数据来设置颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


    //打印函数
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"[FileName:%s]\n" "[FunctionName:%s]\n" "[LineNumber:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__); //打印函数
#define DLOGDATA(data)             LSLOG(@"%@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding])  //数据打印函

#else
#define DLog(...);
#define DLOGDATA(...);
#endif

#define KEY                    @"U6_qpLbU-R2T?"

@interface PublicConfig : NSObject

@end
