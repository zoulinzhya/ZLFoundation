//
//  UINavigationController+GTExtend.m
//  GtOilStorage
//
//  Created by tiangui on 8/3/16.
//  Copyright © 2016 zoulin. All rights reserved.
//

#import "UINavigationController+GTExtend.h"

@implementation UINavigationController(GTExtend)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
    
    item.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    return YES;
}

@end
