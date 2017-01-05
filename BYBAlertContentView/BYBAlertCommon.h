//
//  BYBAlertCommon.h
//  BYBAlertContentView
//
//  Created by 白永炳 on 16/12/26.
//  Copyright © 2016年 BYB. All rights reserved.
//

#ifndef BYBAlertCommon_h
#define BYBAlertCommon_h

#define WeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define StrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

#define MINSIZEIPHONE (SCREEN_WIDTH>320?NO:YES)
// 判断系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//屏幕宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define GOLDENSECTION 0.8

#define COLOR(a,b,c,d) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:d]


#endif /* BYBAlertCommon_h */
