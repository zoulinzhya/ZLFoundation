//
//  UIButton+GTExtend.h
//  GtOilStorage
//
//  Created by tiangui on 8/8/16.
//  Copyright © 2016 zoulin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GTButtonType) {
    GTButtonTypeTextLine = 0
};

@interface UIButton (GTExtend)

- (void)settingGTButtonType:(GTButtonType)type color:(UIColor *)color highlight:(UIColor *)highlight;

@end
