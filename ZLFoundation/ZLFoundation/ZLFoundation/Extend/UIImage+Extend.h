//
//  UIImage+Extend.h
//  GtOilStorage
//
//  Created by tiangui on 7/25/16.
//  Copyright © 2016 zoulin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend_Color)

/**
 *Desc:根据颜色值  封装为一张图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

@end
