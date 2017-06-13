//
//  ActionSheetDelegate.h
//  GtOilStorage
//
//  Created by zoulin on 16/2/25.
//  Copyright © 2016年 zoulin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ActionSheetDelegate <NSObject>

@required //代理协议实现 必须实现的方法

- (void)ShowActionSheet;

@end
