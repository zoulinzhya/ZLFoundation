//
//  MBProgressHUD+GTExtend.h
//  GtOilStorage
//
//  Created by tiangui on 7/27/16.
//  Copyright © 2016 zoulin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, GTHUDExtType) {
    GTHUDExtTypeText = 0,
    GTHUDExtTypeWarn = 1,  //感叹号提示，延迟2s
    GTHUDExtTypeWarnDelayFour = 2, //感叹号提示，延迟4s
    GTHUDExtTypeSuccess = 3, //勾提示，延迟2s
};

@interface MBProgressHUD (GTExtend)

+ (void) showGTHUDExtType:(GTHUDExtType)type conteinerView:(UIView *)container message:(NSString *)message;

//显示message
+ (void) showTextOnly:(UIView *)view message: (NSString *)message;

//显示提示内容和一张出错的图片提示
+ (void)showWithCustomView:(UIViewController *)nViewController tips:(NSString *)nString;

//这个使用  是不带导航栏的
+ (void)showWithUserLogoutCustomView:(UIViewController *)nViewController tips:(NSString *)nString;

//这个使用  是带导航栏的
+ (void)showWithNavBarCustomView:(UIViewController *)nViewController tips:(NSString *)nString;

@end
