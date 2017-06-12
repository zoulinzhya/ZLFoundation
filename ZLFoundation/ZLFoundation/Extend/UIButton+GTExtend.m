//
//  UIButton+GTExtend.m
//  GtOilStorage
//
//  Created by tiangui on 8/8/16.
//  Copyright © 2016 zoulin. All rights reserved.
//

#import "UIButton+GTExtend.h"

@implementation UIButton (GTExtend)

- (void)settingGTButtonType:(GTButtonType)type color:(UIColor *)color highlight:(UIColor *)highlight {
    switch (type) {
        case GTButtonTypeTextLine:
            [self setBackgroundImage:[self borderLineImageWithColor:color] forState:UIControlStateNormal];
            [self setBackgroundImage:[self borderLineImageWithColor:highlight] forState:UIControlStateHighlighted];
            
            [self setTitleColor:color forState:UIControlStateNormal];
            [self setTitleColor:highlight forState:UIControlStateHighlighted];
            break;
            
        default:
            NSAssert(NO, @"GTButtonType Can't support type....");
            break;
    }
}


- (UIImage *)borderLineImageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, 24, 24);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 1, 1) cornerRadius:4];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddPath(context, [path CGPath]);
    
    CGContextSetStrokeColorWithColor(context, [color CGColor]);
    CGContextSetLineWidth(context, 0.5);
    CGContextStrokePath(context);
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(12, 12, 12, 12)];
}

@end
