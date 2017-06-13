//
//  MBProgressHUD+GTExtend.m
//  GtOilStorage
//
//  Created by tiangui on 7/27/16.
//  Copyright © 2016 zoulin. All rights reserved.
//

#import "MBProgressHUD+GTExtend.h"

@implementation MBProgressHUD (GTExtend)

+ (void) showGTHUDExtType:(GTHUDExtType)type conteinerView:(UIView *)container message:(NSString *)message {
    MBProgressHUD *HUDView = [[MBProgressHUD alloc] initWithView:container];
    [container addSubview:HUDView];
    
    CGFloat delay = 2.0;
    UIImageView * imageView = nil;
    
    switch (type) {
        case GTHUDExtTypeWarn:
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic-error.png"]];
        break;
        
        case GTHUDExtTypeWarnDelayFour:
            delay = 4.0;
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic-error.png"]];
        break;
        
        case GTHUDExtTypeSuccess:
            imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic-success.png"]];
        break;
        
        default:
            NSLog(@"default HUD show.");
        break;
    }
    
    
    if (imageView != nil) {
        // The sample image is based on the work by http://www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
        // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
        HUDView.customView = imageView;
        
        // Set custom view mode
        HUDView.mode = MBProgressHUDModeCustomView;
    } else {
        HUDView.mode = MBProgressHUDModeText;
    }
    
    HUDView.labelText = [[NSString alloc] initWithFormat:@"%@", message];  //@"Completed";
    
    [HUDView show:YES];
    [HUDView hide:YES afterDelay:delay];
}

#pragma mark - Personal Methods
+ (void) showTextOnly:(UIView *)view message: (NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.margin = 10.f;
    //hud.layer.cornerRadius = 2.0;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2.0];
}

//这个使用  是不带导航栏的
+ (void)showWithCustomView:(UIViewController *)nViewController tips:(NSString *)nString
{
    MBProgressHUD *HUDView = [[MBProgressHUD alloc] initWithView:nViewController.view];
    [nViewController.view addSubview:HUDView];
    
    // The sample image is based on the work by http://www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
    // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
    HUDView.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic-error.png"]];
    
    // Set custom view mode
    HUDView.mode = MBProgressHUDModeCustomView;
    
    //HUD.delegate = nViewController;  //测试注释
    HUDView.labelText = [[NSString alloc] initWithFormat:@"%@", nString];  //@"Completed";
    
    [HUDView show:YES];
    [HUDView hide:YES afterDelay:2.0];
}

//这个使用  是不带导航栏的
+ (void)showWithUserLogoutCustomView:(UIViewController *)nViewController tips:(NSString *)nString
{
    MBProgressHUD *HUDView = [[MBProgressHUD alloc] initWithView:nViewController.view];
    [nViewController.view addSubview:HUDView];
    
    // The sample image is based on the work by http://www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
    // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
    HUDView.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic-error.png"]];
    
    // Set custom view mode
    HUDView.mode = MBProgressHUDModeCustomView;
    
    HUDView.labelText = [[NSString alloc] initWithFormat:@"%@", nString];  //@"Completed";
    
    [HUDView show:YES];
    [HUDView hide:YES afterDelay:4.0];
}

//这个使用  是带导航栏的
+ (void)showWithNavBarCustomView:(UIViewController *)nViewController tips:(NSString *)nString
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:nViewController.navigationController.view];
    [nViewController.navigationController.view addSubview:HUD];
    
    // The sample image is based on the work by http://www.pixelpressicons.com, http://creativecommons.org/licenses/by/2.5/ca/
    // Make the customViews 37 by 37 pixels for best results (those are the bounds of the build-in progress indicators)
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic-error.png"]];
    
    // Set custom view mode
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = [[NSString alloc] initWithFormat:@"%@", nString];  //@"Completed";
    
    [HUD show:YES];
    [HUD hide:YES afterDelay:2.0];
}

@end
