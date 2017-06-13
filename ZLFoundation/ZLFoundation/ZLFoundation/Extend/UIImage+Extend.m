//
//  UIImage+Extend.m
//  GtOilStorage
//
//  Created by tiangui on 7/25/16.
//  Copyright © 2016 zoulin. All rights reserved.
//

#import "UIImage+Extend.h"

@implementation UIImage (Extend_Color)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
